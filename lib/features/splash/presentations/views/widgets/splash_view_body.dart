import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:smart_store/core/utils/app_images.dart';

import '../../../../onboarding/presentation/views/onboarding_view.dart';

class SplashViewBody extends StatefulWidget {
  const SplashViewBody({super.key});

  @override
  State<SplashViewBody> createState() => _SplashViewBodyState();
}

class _SplashViewBodyState extends State<SplashViewBody> {
  double logoScale = 0.0;
  double logoTurns = 0.5;
  double logoLeft = 0;

  double textLeft = 0;
  double textOpacity = 0.0;

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      final size = MediaQuery.of(context).size;

      setState(() {
        logoLeft = (size.width - 60) / 2;
      });

      Timer(const Duration(milliseconds: 600), () {
        if (!mounted) return;

        setState(() {
          logoScale = 1;
          logoTurns = 0;
        });
      });

      Timer(const Duration(milliseconds: 3200), () {
        if (!mounted) return;

        setState(() {
          textOpacity = 1;
          logoLeft = size.width * .18;
        });
      });

      Timer(const Duration(milliseconds: 6200), () {
        if (!mounted) return;

        Navigator.pushReplacementNamed(
          context,
          OnBoardingView.routeName,
        );
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final logoTop = size.height * .42;

    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          AnimatedPositioned(
            duration: const Duration(milliseconds: 1400),
            curve: Curves.easeInOutCubic,
            top: logoTop,
            left: logoLeft,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                AnimatedRotation(
                  turns: logoTurns,
                  duration: const Duration(milliseconds: 1200),
                  curve: Curves.easeOutCubic,
                  child: AnimatedScale(
                    scale: logoScale,
                    duration: const Duration(milliseconds: 1000),
                    curve: Curves.elasticOut,
                    child: SvgPicture.asset(
                      AppImages.logo,
                      width: 60,
                    ),
                  ),
                ),

                AnimatedContainer(
                  duration: const Duration(milliseconds: 700),
                  curve: Curves.easeInOut,
                  width: textOpacity == 1 ? 12 : 0,
                ),

                AnimatedOpacity(
                  opacity: textOpacity,
                  duration: const Duration(milliseconds: 700),
                  curve: Curves.easeIn,
                  child: AnimatedSlide(
                    duration: const Duration(milliseconds: 700),
                    curve: Curves.easeOutCubic,
                    offset: textOpacity == 1
                        ? Offset.zero
                        : const Offset(-0.25, 0),
                    child: SvgPicture.asset(
                      AppImages.smartStore,
                      height: 32,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}