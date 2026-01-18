import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:smart_store/core/utils/app_color.dart';
import 'package:smart_store/core/utils/app_dimensions.dart';
import 'package:smart_store/core/widgets/custom_button.dart';
import 'package:smart_store/features/auth/presentation/views/widgets/log_in_widgets/custom_email_text_field.dart';

class ForgetPasswordViewBody extends StatefulWidget {
  const ForgetPasswordViewBody({super.key});

  @override
  State<ForgetPasswordViewBody> createState() =>
      _ForgetPasswordViewBodyState();
}

class _ForgetPasswordViewBodyState extends State<ForgetPasswordViewBody> {
  late TextEditingController emailController;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  AutovalidateMode autoValidateMode = AutovalidateMode.disabled;

  @override
  void initState() {
    emailController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: AppDimensions.authScreenPadding,
          ),
          child: Form(
            key: formKey,
            autovalidateMode: autoValidateMode,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SvgPicture.asset('assets/images/logo.svg'),
                const SizedBox(height: 40),
                Text(
                  'Forgot Password?',
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.w700,
                    color: AppColors.primaryTextColor,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  'Please enter the email address associated with your account.',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    color: AppColors.greyTextColor,
                  ),
                ),
                const SizedBox(height: 32),
                Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    'Email ',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: AppColors.primaryTextColor,
                    ),
                  ),
                ),
                const SizedBox(height: 8),
                EmailField(emailController: emailController),
                const SizedBox(height: 24),
                CustomButton(
                  text: 'Reset Password',
                  onTap: () {
                    if (formKey.currentState!.validate()) {
                    } else {
                      setState(() {
                        autoValidateMode = AutovalidateMode.always;
                      });
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
