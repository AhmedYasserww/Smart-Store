import 'package:flutter/material.dart';

import '../../features/auth/presentation/views/forget_password_view.dart';
import '../../features/auth/presentation/views/log_in_view.dart';
import '../../features/auth/presentation/views/register_view.dart';

Route<dynamic> onGenerateRoutes(RouteSettings settings) {
  switch (settings.name) {
    // case SplashView.routeName:
    //   return MaterialPageRoute(builder: (context) => const SplashView());
    //  case OnBoardingView.routeName:
    //    return MaterialPageRoute(builder: (context) => const OnBoardingView());
    case LogInView.routeName:
      return MaterialPageRoute(builder: (context) => const LogInView());
    case RegisterView.routeName:
      return MaterialPageRoute(builder: (context) => const RegisterView());
    case ForgetPasswordView.routeName:
      return MaterialPageRoute(builder: (context) => const ForgetPasswordView());
    //   case ButtonNavBarView.routeName:
    //     return MaterialPageRoute(builder: (context) => const ButtonNavBarView());
    //   case HomeView.routeName:
    //   return MaterialPageRoute(builder: (context) => const HomeView());


    default:
      return MaterialPageRoute(builder: (context) => const Scaffold());
  }
}
