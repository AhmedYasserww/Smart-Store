import 'package:flutter/material.dart';

import '../../features/auth/presentation/views/log_in_view.dart';

Route<dynamic> onGenerateRoutes(RouteSettings settings) {
  switch (settings.name) {
    // case SplashView.routeName:
    //   return MaterialPageRoute(builder: (context) => const SplashView());
    //  case OnBoardingView.routeName:
    //    return MaterialPageRoute(builder: (context) => const OnBoardingView());
    case LogInView.routeName:
      return MaterialPageRoute(builder: (context) => const LogInView());
    // case SignUpView.routeName:
    //   return MaterialPageRoute(builder: (context) => const SignUpView());
    //   case ButtonNavBarView.routeName:
    //     return MaterialPageRoute(builder: (context) => const ButtonNavBarView());
    //   case HomeView.routeName:
    //   return MaterialPageRoute(builder: (context) => const HomeView());


    default:
      return MaterialPageRoute(builder: (context) => const Scaffold());
  }
}
