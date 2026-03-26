import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:smart_store/core/widgets/custom_button.dart';
import '../../../../../../core/constants/verify_otp_enum.dart';
import '../../../../../../core/helper_functions/save_user_data.dart';
import '../../../manager/forget_password_cubit/forget_password_cubit.dart';
import '../log_in_widgets/custom_email_text_field.dart';
import '../../verification_view.dart';

class ForgetPasswordForm extends HookWidget {
  const ForgetPasswordForm({super.key});

  @override
  Widget build(BuildContext context) {
    final emailController = useTextEditingController();
    final formKey = useMemoized(() => GlobalKey<FormState>());
    final autoValidate = useState(AutovalidateMode.disabled);

    return BlocConsumer<ForgetPasswordCubit, ForgetPasswordState>(
      listener: (context, state) async {
        if (state is ForgetPasswordSuccess) {
          final userId = state.forgetPasswordModel.data!.userId;

          await UserPreferences.saveTempUserId(userId);

          print("User ID saved: $userId");
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              backgroundColor: Colors.green,
              content: Text(state.forgetPasswordModel.message), ), );

          Navigator.pushNamed(
            context,
            VerificationView.routeName,
            arguments: {
              "userId": userId,
              "type": OtpType.forgetPassword,
            },
          );
        }

        if (state is ForgetPasswordFailure) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(state.errorMessage)),
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
              const SizedBox(height: 8),
              Text(
                'Email',
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: Color(0xFF000000),
                ),
              ),
              const SizedBox(height: 8),
              EmailField(emailController: emailController),
              const SizedBox(height: 24),
              CustomButton(
                text: 'Reset Password',
                isLoading: state is ForgetPasswordLoading,
                onTap: () {
                  if (formKey.currentState!.validate()) {
                    context.read<ForgetPasswordCubit>().forgetPassword(
                      email: emailController.text,
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