import 'package:flutter/material.dart';
import 'package:smart_store/features/splash/presentations/views/widgets/splash_view_body.dart';
class SplashView extends StatelessWidget {
  const SplashView({super.key});
  static const String routeName = 'splash_view';
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SplashViewBody(),
    );

  }
}

