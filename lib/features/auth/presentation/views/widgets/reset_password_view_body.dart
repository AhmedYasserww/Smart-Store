import 'package:flutter/material.dart';
import '../../../../../core/utils/app_dimensions.dart';
import 'reset_password_widgets/reset_password_form.dart';
import 'reset_password_widgets/reset_password_header_section.dart';

class ResetPasswordViewBody extends StatelessWidget {
  const ResetPasswordViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: AppDimensions.authScreenPadding,
        ),
        child: SafeArea(
          child: Column(
            children: const [
              SizedBox(height: 32),

              ResetPasswordHeaderSection(),

              SizedBox(height: 32),

              ResetPasswordForm(),

              SizedBox(height: 16),
            ],
          ),
        ),
      ),
    );
  }
}