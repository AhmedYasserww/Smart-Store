import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../core/widgets/custom_button.dart';
import 'otp_field.dart';


class VerificationForm extends HookWidget {
  const VerificationForm({super.key});

  @override
  Widget build(BuildContext context) {

    final formKey = useMemoized(() => GlobalKey<FormState>());
    final autoValidate = useState(AutovalidateMode.disabled);
    final otpController = useTextEditingController();

    return BlocConsumer<VerificationCubit, VerificationState>(
      listener: (context, state) {
        if (state is VerificationSuccess) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              backgroundColor: Colors.green,
              content: Text(state.message),
            ),
          );
        }

        if (state is VerificationFailure) {
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

              Text(
                'Enter Verification Code',
                style: TextStyle(fontSize: 14),
              ),
              const SizedBox(height: 16),

              OtpField(controller: otpController),

              const SizedBox(height: 24),

              CustomButton(
                text: 'Verify',
                isLoading: state is VerificationLoading,
                onTap: () {
                  if (formKey.currentState!.validate()) {
                    context.read<VerificationCubit>().verifyCode(
                      otpController.text.trim(),
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