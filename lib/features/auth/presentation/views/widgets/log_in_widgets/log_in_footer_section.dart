import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:smart_store/features/guest/presentation/views/guest_browsing_view.dart';
import '../../../../../../core/utils/app_images.dart';
import '../../../../../bottom_nav_bar/presentation/views/bottom_nav_bar_view.dart';
import '../../../manager/google_log_in_cubit/google_login_cubit.dart';
import '../log_in_widgets/custom_navigate_to_register.dart';
import '../log_in_widgets/or_widget.dart';
import '../../../views/register_view.dart';
import '../../../../../../core/helper_functions/navigation_helper.dart';
import 'custom_social_container.dart';

class LoginFooterSection extends StatelessWidget {
  const LoginFooterSection({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<GoogleLoginCubit, GoogleLoginState>(
      listener: (context, state) {
        if (state is GoogleLoginSuccess) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(state.message),
              backgroundColor: Colors.green,
            ),
          );
          Navigator.of(context).pushNamedAndRemoveUntil(
            CustomNavigationBar.routeName,
            (route) => false,
          );
        }
        if (state is GoogleLoginFailure) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(state.errorMessage),
              backgroundColor: Colors.red,
            ),
          );
        }
      },
      child: Column(
        children: [
          const OrDivider(),
          const SizedBox(height: 24),

          CustomSocialContainer(
            title: "Continue as Guest",
            onTap: () {
              Navigator.of(context).pushNamed(GuestBrowsingView.guestBrowsing);
            },
          ),
          const SizedBox(height: 16),

          BlocBuilder<GoogleLoginCubit, GoogleLoginState>(
            builder: (context, state) {
              return CustomSocialContainer(
                title: state is GoogleLoginLoading
                    ? "Loading..."
                    : "Continue with Google",
                icon: state is GoogleLoginLoading
                    ? const SizedBox(
                        width: 18,
                        height: 18,
                        child: CircularProgressIndicator(strokeWidth: 2),
                      )
                    : SvgPicture.asset(
                        AppImages.googleIcon,
                        width: 18,
                        height: 18,
                      ),
                onTap: state is GoogleLoginLoading
                    ? () {}
                    : () {
                        context.read<GoogleLoginCubit>().loginWithGoogle();
                      },
              );
            },
          ),

          const SizedBox(height: 32),

          CustomNavigateToRegisterOrLoginOrResendCode(
            textMessage: "Don't have an account?",
            buttonText: "Sign Up",
            onPressed: () {
              NavigationHelper.pushWithCupertinoTransition(
                context,
                RegisterView(),
              );
            },
          ),
        ],
      ),
    );
  }
}
