import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import '../../../../../../core/utils/app_style.dart';
import '../../../../../../core/widgets/custom_button.dart';
import '../log_in_widgets/custom_password_text_field.dart';
import '../register_widgets/confirm_password_field_widget.dart';

class ResetPasswordForm extends HookWidget {
  const ResetPasswordForm({super.key});

  @override
  Widget build(BuildContext context) {

    final formKey = useMemoized(() => GlobalKey<FormState>());
    final autoValidate = useState(AutovalidateMode.disabled);

    final newPasswordController = useTextEditingController();
    final confirmPasswordController = useTextEditingController();

    final passwordVisible = useState(true);
    final confirmPasswordVisible = useState(true);

    return Form(
      key: formKey,
      autovalidateMode: autoValidate.value,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'New Password',
            style: AppStyle.styleRegular14,
          ),

          const SizedBox(height: 8),

          PasswordField(
            passwordController: newPasswordController,
            visible: passwordVisible.value,
            toggleVisibility: () {
              passwordVisible.value = !passwordVisible.value;
            },
          ),

          const SizedBox(height: 8),
          const Text(
            'Confirm Password',
            style: AppStyle.styleRegular14,
          ),
          const SizedBox(height: 8),

          ConfirmPasswordField(
            confirmPasswordController: confirmPasswordController,
            passwordController: newPasswordController,
            visible: confirmPasswordVisible.value,
            toggleVisibility: () {
              confirmPasswordVisible.value =
              !confirmPasswordVisible.value;
            },
          ),

          const SizedBox(height: 24),

          CustomButton(
            text: "Reset Password",
            onTap: () {

              if (formKey.currentState!.validate()) {

                print("New Password: ${newPasswordController.text}");

              } else {
                autoValidate.value = AutovalidateMode.always;
              }
            },
          ),
        ],
      ),
    );
  }
}