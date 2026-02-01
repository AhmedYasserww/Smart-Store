import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:smart_store/core/utils/app_dimensions.dart';
import 'package:smart_store/core/utils/app_style.dart';
import 'package:smart_store/core/widgets/custom_button.dart';
import 'package:smart_store/features/auth/presentation/views/widgets/log_in_widgets/or_widget.dart';

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
                    SvgPicture.asset("assets/images/logo.svg"),
                    const SizedBox(height: 40),

                    Text(
                      'Welcome Back!',
                      style: AppStyle.styleBold28,
                    ),
                    const SizedBox(height: 8),

                    Text(
                      'Sign in to continue your Smart store journey.',
                      textAlign: TextAlign.center,
                      style: AppStyle.styleGreyRegular16,
                    ),

                    const SizedBox(height: 32),

                    Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        'Email',
                        style: AppStyle.styleRegular14,
                      ),
                    ),
                    const SizedBox(height: 8),
                    EmailField(emailController: emailController),

                    const SizedBox(height: 16),

                    Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        'Password',
                        style: AppStyle.styleRegular14,
                      ),
                    ),
                    const SizedBox(height: 8),
                    PasswordField(
                      passwordController: passwordController,
                      visible: visible,
                      toggleVisibility: toggleVisibility,
                    ),

                    const SizedBox(height: 8),

                    Align(
                      alignment: Alignment.centerRight,
                      child: GestureDetector(
                        onTap: () {
                          Navigator.of(context)
                              .pushNamed(ForgetPasswordView.routeName);
                        },
                        child: Text(
                          'Forgot Password?',
                          style: AppStyle.styleGreyMedium14.copyWith(
                            decoration: TextDecoration.underline,
                          ),
                        ),
                      ),
                    ),

                    const SizedBox(height: 24),

                    CustomButton(
                      text: "Sign in",
                      onTap: () {
                        if (formKey.currentState!.validate()) {
                          Navigator.of(context)
                              .pushNamed(ForgetPasswordView.routeName);
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
                      onFirstPressed: () {},
                      onSecondPressed: () {},
                      onThirdPressed: () {},
                    ),

                    const SizedBox(height: 32),

                    CustomNavigateToRegisterOrLoginOrResendCode(
                      textMessage: "Don’t have an account?",
                      buttonText: "Sign Up",
                      onPressed: () {
                        Navigator.of(context)
                            .pushNamed(RegisterView.routeName);
                      },
                    ),

                    const SizedBox(height: 16),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
