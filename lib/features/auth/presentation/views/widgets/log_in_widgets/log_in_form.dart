import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:smart_store/core/helper_functions/navigation_helper.dart';
import 'package:smart_store/features/auth/presentation/views/forget_password_view.dart';
import 'package:smart_store/features/bottom_nav_bar/presentation/views/bottom_nav_bar_view.dart';
import '../../../../../../core/helper_functions/save_user_data.dart';
import '../../../../../../core/widgets/custom_button.dart';
import '../../../../../more/profile/presentation/manager/get_profile_cubit/get_profile_cubit.dart';
import '../../../../data/entities/log_in_entity.dart';
import '../../../manager/log_in_cubit/log_in_cubit.dart';
import 'custom_email_text_field.dart';
import 'custom_password_text_field.dart';

class LoginForm extends HookWidget {
  const LoginForm({super.key});

  @override
  Widget build(BuildContext context) {

    final emailController = useTextEditingController();
    final passwordController = useTextEditingController();

    final passwordVisible = useState(true);

    final formKey = useMemoized(() => GlobalKey<FormState>());
    final autoValidate = useState(AutovalidateMode.disabled);

    return BlocConsumer<LogInCubit, LogInState>(

      listener: (context, state) async {

        if (state is LogInSuccess) {

          final data = state.loginModel.data!;

          await UserPreferences.saveLoginData(
            id: data.id,
            email: data.email,
            phoneNumber: data.phoneNumber,
            accessToken: data.accessToken,
            refreshToken: data.refreshToken,
            role: data.role,
            isEmailConfirmed: data.isEmailConfirmed,
          );
          context.read<GetProfileCubit>().getProfile();
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              backgroundColor: Colors.green,
              content: Text(state.loginModel.message), ), );
          Navigator.of(context).pushNamedAndRemoveUntil(CustomNavigationBar.routeName, (route) => false, );
        }

        if (state is LogInFailure) {

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
            children: [

              EmailField(emailController: emailController),

              const SizedBox(height: 16),

              PasswordField(
                passwordController: passwordController,
                visible: passwordVisible.value,
                toggleVisibility: () {
                  passwordVisible.value = !passwordVisible.value;
                },
              ),

              const SizedBox(height: 8),

              Align(
                alignment: Alignment.centerRight,
                child: GestureDetector(
                  onTap: () {
                    NavigationHelper.pushWithCupertinoTransition(
                      context,
                      ForgetPasswordView(),
                    );
                  },
                  child: const Text(
                    "Forgot Password?",
                    style: TextStyle(decoration: TextDecoration.underline),
                  ),
                ),
              ),

              const SizedBox(height: 24),

              CustomButton(
                text: "Sign in",
                isLoading: state is LogInLoading,
                onTap: () {

                  if (formKey.currentState!.validate()) {

                    context.read<LogInCubit>().logIn(
                      LoginEntity(
                        email: emailController.text,
                        password: passwordController.text,
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