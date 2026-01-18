import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:smart_store/core/utils/app_color.dart';
import 'package:smart_store/features/auth/presentation/views/widgets/log_in_widgets/or_widget.dart';

import '../../../../../core/utils/app_dimensions.dart';
import '../../../../../core/widgets/custom_button.dart';
import '../forget_password_view.dart';
import '../register_view.dart';
import 'log_in_widgets/custom_email_text_field.dart';
import 'log_in_widgets/custom_navigate_to_register.dart';
import 'log_in_widgets/custom_password_text_field.dart';
import 'log_in_widgets/custom_social_icon.dart';

class LogInViewBody extends StatefulWidget {
  const LogInViewBody({super.key});

  @override
  State<LogInViewBody> createState() => _LogInViewBodyState();
}

class _LogInViewBodyState extends State<LogInViewBody> {
  bool visible = true;
  bool rememberMe = false;
  late TextEditingController emailController;
  late TextEditingController passwordController;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  AutovalidateMode autoValidateMode = AutovalidateMode.disabled;

  void toggleVisibility() {
    setState(() {
      visible = !visible;
    });
  }

  @override
  void initState() {
    emailController = TextEditingController();
    passwordController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  void showErrorMessage(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message), backgroundColor: Colors.red),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Center(
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: AppDimensions.authScreenPadding,
              ),
              child: Form(
                key: formKey,
                autovalidateMode: autoValidateMode,
                child: Column(
                  children: [
                    Center(child: SvgPicture.asset("assets/images/logo.svg")),
                    const SizedBox(height: 40),
                    Text(
                      'Welcome Back!',
                      style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    SizedBox(height: 8),
                    Text(
                      'Sign in to continue your Smart store journey.',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: AppColors.greyTextColor,
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    const SizedBox(height: 32),
                    Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        'Email',
                        style: TextStyle(
                          color: AppColors.primaryTextColor,
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                    SizedBox(height: 8),
                    EmailField(emailController: emailController),
                    const SizedBox(height: 16),
                    Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        'password',
                        style: TextStyle(
                          color: AppColors.primaryTextColor,
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                    SizedBox(height: 8),
                    PasswordField(
                      passwordController: passwordController,
                      visible: visible,
                      toggleVisibility: toggleVisibility,
                    ),
                    const SizedBox(height: 8),

                    Align(
                      alignment: Alignment.centerRight,
                      child: GestureDetector(
                        onTap: () {},
                        child: Text(
                          'Forgot Password?',
                          style: TextStyle(
                            color: const Color(0xFF666666),
                            fontSize: 14,
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w500,
                            decoration: TextDecoration.underline,
                          ),
                        ),
                      ),
                    ),

                    SizedBox(height: 24),
                    CustomButton(
                      text: "Log in",
                      onTap: () {
                        if (formKey.currentState!.validate()) {
                          Navigator.of(
                            context,
                          ).pushNamed(ForgetPasswordView.routeName);
                        } else {
                          setState(() {
                            autoValidateMode = AutovalidateMode.always;
                          });
                        }
                      },
                    ),
                    const SizedBox(height: 16),
                    OrDivider(),
                    const SizedBox(height: 16),
                    CustomSocialIcons(
                      firstIcon: 'assets/images/googleIcon.svg',
                      secondIcon: 'assets/images/face_bookIcon.svg',
                      thirdIcon: 'assets/images/appleIcon.svg',
                      onFirstPressed: () {
                        print('Google pressed');
                      },
                      onSecondPressed: () {
                        print('Facebook pressed');
                      },
                      onThirdPressed: () {
                        print('Apple pressed');
                      },
                    ),
                    SizedBox(height: 32),

                    CustomNavigateToRegisterOrLogin(
                      textMessage: "Don’t have an account?",
                      buttonText: "Sign Up",
                      onPressed: () {
                        Navigator.of(context).pushNamed(RegisterView.routeName);
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),

        // ⬇ Loading overlay
      ],
    );
  }
}
