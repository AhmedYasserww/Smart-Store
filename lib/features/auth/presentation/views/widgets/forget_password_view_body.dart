import 'package:flutter/material.dart';
import 'package:smart_store/core/utils/app_dimensions.dart';
import 'forget_password_widgets/forget_password_form.dart';
import 'forget_password_widgets/forget_password_header.dart';

class ForgetPasswordViewBody extends StatelessWidget {
  const ForgetPasswordViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: AppDimensions.authScreenPadding,
            ),
            child: Column(
              children: const [
                SizedBox(height: 32),

                // Header Section
                ForgetPasswordHeader(),

                SizedBox(height: 32),

                // Form with BlocConsumer
                ForgetPasswordForm(),

                SizedBox(height: 16),
              ],
            ),
          ),
        ),
      ),
    );
  }
}