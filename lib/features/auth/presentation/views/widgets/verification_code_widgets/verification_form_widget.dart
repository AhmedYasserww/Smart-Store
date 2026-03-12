import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import '../../../../../../core/helper_functions/save_user_data.dart';
import '../../../../../../core/helper_functions/show_alert_dialog.dart';
import '../../../../../../core/utils/app_style.dart';
import '../../../../../../core/widgets/custom_button.dart';
import '../../../manager/verification_otp_cubit/verify_otp_cubit.dart';
import '../verification_code_widgets/otp_field.dart';
class VerificationForm extends HookWidget {
  const VerificationForm({super.key});

  @override
  Widget build(BuildContext context) {
    final formKey = useRef(GlobalKey<FormState>()).value;
    final autoValidate = useState(AutovalidateMode.disabled);
    final otpController = useTextEditingController();

    return BlocConsumer<VerifyOtpCubit, VerifyOtpState>(
        listener: (context, state) async {
          if (state is VerifyOtpSuccess) {

            showSuccessDialog(context, state.message);

            final userId = await UserPreferences.getUserId();
            print("User ID: $userId");
          }

          if (state is VerifyOtpFailure) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                backgroundColor: Colors.red,
                content: Text(state.errorMessage),
              ),
            );
          }
        },
      builder: (context, state) {
        return Form(
          key: formKey,
          autovalidateMode: autoValidate.value,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              const Text(
                'Enter Verification Code',
                style: AppStyle.styleRegular14,
              ),
              const SizedBox(height: 16),

              OtpField(controller: otpController),

              const SizedBox(height: 24),

              CustomButton(
                text: 'Verify',
                isLoading: state is VerifyOtpLoading,
                onTap: () async {
                  if (formKey.currentState!.validate()) {

                    // جلب الـ userId من SharedPreferences
                    final userId = await UserPreferences.getUserId();

                    context.read<VerifyOtpCubit>().verifyOtp(
                      userId: userId,
                      otp: otpController.text.trim(),
                    );

                  } else {
                    autoValidate.value = AutovalidateMode.always;
                  }
                },
              ),
            ],
          ),
        );
      },
    );
  }
}
