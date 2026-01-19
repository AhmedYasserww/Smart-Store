import 'package:flutter/material.dart';
import '../../../data/on_boarding_model.dart';
import 'animated_image_widget.dart';
import 'animated_text_widget.dart';
import 'on_boarding_indicator_button.dart';
import 'on_boarding_skip.dart';

class AnimatedOnBoardingPage extends StatefulWidget {
  final OnBoardingModel model;
  final int index;
  final int currentIndex;
  final VoidCallback onNext;
  final double buttonBottom;
  final double textSpacing;
  final double imageHeightFactor;

  const AnimatedOnBoardingPage({
    super.key,
    required this.model,
    required this.index,
    required this.currentIndex,
    required this.onNext,
    required this.buttonBottom,
    required this.textSpacing,
    required this.imageHeightFactor,
  });

  @override
  State<AnimatedOnBoardingPage> createState() => _AnimatedOnBoardingPageState();
}

class _AnimatedOnBoardingPageState extends State<AnimatedOnBoardingPage>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _imageAnimation;
  late Animation<double> _textAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1200),
    );

    if (widget.index == 1) {
      _imageAnimation = Tween<double>(begin: -150, end: 0).animate(
          CurvedAnimation(parent: _controller, curve: Curves.easeOut));
      _textAnimation = Tween<double>(begin: -100, end: 0).animate(
          CurvedAnimation(
              parent: _controller,
              curve: const Interval(0.3, 1.0, curve: Curves.easeOut)));
    } else {
      _imageAnimation = Tween<double>(begin: -100, end: 0).animate(
          CurvedAnimation(parent: _controller, curve: Curves.easeOut));
      _textAnimation = Tween<double>(begin: 150, end: 0).animate(
          CurvedAnimation(parent: _controller, curve: Curves.easeOut));
    }

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        OnBoardingSkip(),
        AnimatedImageWidget(
          controller: _controller,
          image: widget.model.image,
          alignment: widget.index == 1
              ? Alignment.bottomCenter
              : widget.model.imageAlignment,
          fromBottom: widget.index == 1,
          heightFactor: widget.imageHeightFactor,
        ),
        AnimatedTextWidget(
          controller: _controller,
          title: widget.model.title,
          subTitle: widget.model.subTitle,
          index: widget.index,
          textSpacing: widget.textSpacing,
        ),
        Positioned(
          bottom: widget.buttonBottom,
          left: 0,
          right: 0,
          child: Center(
            child: OnBoardingIndicatorButton(
              currentIndex: widget.index,
              onTap: widget.onNext,
            ),
          ),
        ),
      ],
    );
  }
}
