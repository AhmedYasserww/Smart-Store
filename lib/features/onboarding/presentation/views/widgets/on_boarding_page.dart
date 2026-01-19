import 'package:flutter/material.dart';
import '../../../data/on_boarding_model.dart';
import 'animated_boarding_page.dart';
class OnBoardingPage extends StatelessWidget {
  final OnBoardingModel model;
  final int index;
  final int currentIndex;
  final VoidCallback onNext;

  const OnBoardingPage({
    super.key,
    required this.model,
    required this.index,
    required this.currentIndex,
    required this.onNext,
  });

  static const double buttonBottom = 74;
  static const double textSpacing = 24;
  static const double imageHeightFactor = 0.55;

  @override
  Widget build(BuildContext context) {
    return AnimatedOnBoardingPage(
      model: model,
      index: index,
      currentIndex: currentIndex,
      onNext: onNext,
      buttonBottom: buttonBottom,
      textSpacing: textSpacing,
      imageHeightFactor: imageHeightFactor,
    );
  }
}
