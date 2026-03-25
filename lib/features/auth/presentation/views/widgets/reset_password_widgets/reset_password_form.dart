import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../../core/helper_functions/save_user_data.dart';
import '../../../../../../core/utils/app_style.dart';
import '../../../../../../core/widgets/custom_button.dart';
import '../../../../data/entities/reset_password_entity.dart';
import '../log_in_widgets/custom_password_text_field.dart';
import '../register_widgets/confirm_password_field_widget.dart';
import '../../../manager/reset_password_cubit/reset_password_cubit.dart';

class ResetPasswordForm extends HookWidget {
  const ResetPasswordForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final formKey = useMemoized(() => GlobalKey<FormState>());
    final autoValidate = useState(AutovalidateMode.disabled);

    final newPasswordController = useTextEditingController();
    final confirmPasswordController = useTextEditingController();

    final passwordVisible = useState(true);
    final confirmPasswordVisible = useState(true);

    return BlocConsumer<ResetPasswordCubit, ResetPasswordState>(
      listener: (context, state) {
        if (state is ResetPasswordSuccess) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              backgroundColor: Colors.green,
                content: Text(state.message)),
          );
          // ممكن تخزن الـ userId أو أي داتا لو تحب
          // UserPreferences.saveUserId(state.userId);

          Navigator.popUntil(context, (route) => route.isFirst);
        }

        if (state is ResetPasswordFailure) {
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
                  confirmPasswordVisible.value = !confirmPasswordVisible.value;
                },
              ),
              const SizedBox(height: 24),
              CustomButton(
                text: "Reset Password",
                onTap: () async {
                  if (formKey.currentState!.validate()) {
                    final userId = await UserPreferences.getTempUserId();
                    final token = await UserPreferences.getToken();

                    context.read<ResetPasswordCubit>().resetPassword(
                      entity: ResetPasswordEntity(
                        userId: userId,
                        token: token,
                        newPassword: newPasswordController.text.trim(),
                        confirmPassword: confirmPasswordController.text.trim(),
                      ),
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