import 'package:flutter/material.dart';
import 'package:smart_store/features/onboarding/presentation/views/widgets/onboarding_view_body.dart';
class OnBoardingView extends StatelessWidget {
  const OnBoardingView({super.key});
  static const String routeName = 'onboarding';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: OnBoardingViewBody(),
    );
  }
}
