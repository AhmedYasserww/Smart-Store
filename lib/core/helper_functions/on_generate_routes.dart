import 'package:flutter/material.dart';

Route<dynamic> onGenerateRoutes(RouteSettings settings) {
  switch (settings.name) {
    // case SplashView.routeName:
    //   return MaterialPageRoute(builder: (context) => const SplashView());
    //  case OnBoardingView.routeName:
    //    return MaterialPageRoute(builder: (context) => const OnBoardingView());
    // case SignInView.routeName:
    //   return MaterialPageRoute(builder: (context) => const SignInView());
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
