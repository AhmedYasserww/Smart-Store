import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_store/core/utils/app_dimensions.dart';
import '../../../../../../core/utils/app_style.dart';
import '../../../../../auth/presentation/views/widgets/log_in_widgets/custom_password_text_field.dart';
import '../../../../../auth/presentation/views/widgets/register_widgets/confirm_password_field_widget.dart';
import '../../manager/change_password_cubit/change_password_cubit.dart';
import 'edit_profile_view_widgets/custom_profile_action_button.dart';

class ChangePasswordViewBody extends StatefulWidget {
  const ChangePasswordViewBody({super.key});

  @override
  State<ChangePasswordViewBody> createState() => _ChangePasswordViewBodyState();
}

class _ChangePasswordViewBodyState extends State<ChangePasswordViewBody> {
  final _formKey = GlobalKey<FormState>();

  final _currentPassController = TextEditingController();
  final _newPassController = TextEditingController();
  final _confirmPassController = TextEditingController();

  bool _currentVisible = true;
  bool _newVisible = true;
  bool _confirmVisible = true;

  @override
  void dispose() {
    _currentPassController.dispose();
    _newPassController.dispose();
    _confirmPassController.dispose();
    super.dispose();
  }

  void _submit() {
    if (!_formKey.currentState!.validate()) return;

    context.read<ChangePasswordCubit>().changePassword(
      currentPassword: _currentPassController.text.trim(),
      newPassword: _newPassController.text.trim(),
      confirmNewPassword: _confirmPassController.text.trim(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<ChangePasswordCubit, ChangePasswordState>(
      listener: (context, state) {
        if (state is ChangePasswordSuccess) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(state.message),
              backgroundColor: Colors.green,
            ),
          );
          Navigator.of(context).pop();
        }

        if (state is ChangePasswordFailure) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(state.errorMessage),
              backgroundColor: Colors.red,
            ),
          );
        }
      },
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: AppDimensions.homeScreenPadding,
          ),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 32),

                Text('Password', style: AppStyle.styleRegular14),
                const SizedBox(height: 8),
                PasswordField(
                  passwordController: _currentPassController,
                  visible: _currentVisible,
                  toggleVisibility: () =>
                      setState(() => _currentVisible = !_currentVisible),
                ),

                const SizedBox(height: 16),
                Text('New Password', style: AppStyle.styleRegular14),
                const SizedBox(height: 8),
                PasswordField(
                  passwordController: _newPassController,
                  visible: _newVisible,
                  toggleVisibility: () =>
                      setState(() => _newVisible = !_newVisible),
                ),

                const SizedBox(height: 16),
                Text('Confirm Password', style: AppStyle.styleRegular14),
                const SizedBox(height: 8),
                ConfirmPasswordField(
                  confirmPasswordController: _confirmPassController,
                  passwordController: _newPassController,
                  visible: _confirmVisible,
                  toggleVisibility: () =>
                      setState(() => _confirmVisible = !_confirmVisible),
                ),

                const SizedBox(height: 24),
                BlocBuilder<ChangePasswordCubit, ChangePasswordState>(
                  builder: (context, state) {
                    final isLoading = state is ChangePasswordLoading;
                    return CustomProfileActionButtons(
                     isSaveChangeLoading: isLoading,
                      textButton1: 'Cancel',
                      textButton2:  'Save Changes',
                      onDeleteTap: () => Navigator.of(context).pop(),
                      onSaveTap: isLoading ? () {} : _submit,
                    );
                  },
                ),

                const SizedBox(height: 32),
              ],
            ),
          ),
        ),
      ),
    );
  }
}