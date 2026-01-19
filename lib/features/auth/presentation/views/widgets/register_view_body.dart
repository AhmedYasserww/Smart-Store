import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:smart_store/core/utils/app_color.dart';
import 'package:smart_store/core/utils/app_dimensions.dart';
import 'package:smart_store/core/widgets/custom_button.dart';
import 'package:smart_store/features/auth/presentation/views/forget_password_view.dart';
import 'package:smart_store/features/auth/presentation/views/log_in_view.dart';
import 'package:smart_store/features/auth/presentation/views/widgets/log_in_widgets/or_widget.dart';
import 'package:smart_store/features/auth/presentation/views/widgets/log_in_widgets/custom_social_icon.dart';
import 'package:smart_store/features/auth/presentation/views/widgets/register_widgets/confirm_password_field_widget.dart';
import 'package:smart_store/features/auth/presentation/views/widgets/register_widgets/custom_name_text_field.dart';
import 'package:smart_store/features/auth/presentation/views/widgets/register_widgets/required_field_label.dart';
import 'log_in_widgets/custom_email_text_field.dart';
import 'log_in_widgets/custom_navigate_to_register.dart';
import 'log_in_widgets/custom_password_text_field.dart';

class RegisterViewBody extends StatefulWidget {
  const RegisterViewBody({super.key});

  @override
  State<RegisterViewBody> createState() => _RegisterViewBodyState();
}

class _RegisterViewBodyState extends State<RegisterViewBody> {
  bool passwordVisible = true;
  bool confirmPasswordVisible = true;

  late TextEditingController nameController;
  late TextEditingController emailController;
  late TextEditingController passwordController;
  late TextEditingController confirmPasswordController;

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  AutovalidateMode autoValidateMode = AutovalidateMode.disabled;

  @override
  void initState() {
    nameController = TextEditingController();
    emailController = TextEditingController();
    passwordController = TextEditingController();
    confirmPasswordController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }

  void togglePasswordVisibility() {
    setState(() {
      passwordVisible = !passwordVisible;
    });
  }

  void toggleConfirmPasswordVisibility() {
    setState(() {
      confirmPasswordVisible = !confirmPasswordVisible;
    });
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
              children: [
                const SizedBox(height: 32),
                SvgPicture.asset('assets/images/logo.svg'),
                const SizedBox(height: 40),

                Text(
                  'Create an  account',
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  'Join us and start your Smart store journey.',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: AppColors.greyTextColor,
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                  ),
                ),

                const SizedBox(height: 32),

                RequiredFieldLabel(text: 'Name'),
                const SizedBox(height: 8),
                NameField(nameController: nameController),

                const SizedBox(height: 16),
                RequiredFieldLabel(text: 'Email'),
                const SizedBox(height: 8),
                EmailField(emailController: emailController),

                const SizedBox(height: 16),
                RequiredFieldLabel(text: 'Password'),
                const SizedBox(height: 8),
                PasswordField(
                  passwordController: passwordController,
                  visible: passwordVisible,
                  toggleVisibility: togglePasswordVisibility,
                ),

                const SizedBox(height: 16),
                RequiredFieldLabel(text: 'Confirm Password'),
                const SizedBox(height: 8),
                ConfirmPasswordField(
                  confirmPasswordController: confirmPasswordController,
                  passwordController: passwordController,
                  visible: confirmPasswordVisible,
                  toggleVisibility: toggleConfirmPasswordVisibility,
                ),

                const SizedBox(height: 24),
                CustomButton(
                  text: 'Sign Up',
                  onTap: () {
                    if (formKey.currentState!.validate()) {
                      Navigator.of(context).pushNamed(ForgetPasswordView.routeName);
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
                CustomNavigateToRegisterOrLogin(
                  textMessage: "Have an account?",
                  buttonText: "Sign In",
                  onPressed: () {
                    Navigator.of(context).pushNamed(LogInView.routeName);
                  },
                ),
                SizedBox(height: 16,)

              ],
            ),
          ),
        ),
      ),
    );
  }
}
