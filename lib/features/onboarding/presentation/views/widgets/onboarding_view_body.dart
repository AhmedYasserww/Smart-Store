import 'package:flutter/material.dart';
import '../../../data/on_boarding_model.dart';
import 'on_boarding_page.dart';
import '../../../../../features/auth/presentation/views/log_in_view.dart';

class OnBoardingViewBody extends StatefulWidget {
  const OnBoardingViewBody({super.key});

  @override
  State<OnBoardingViewBody> createState() => _OnBoardingViewState();
}

class _OnBoardingViewState extends State<OnBoardingViewBody> {
  final PageController controller = PageController();
  int currentIndex = 0;

  final List<OnBoardingModel> pages = [
    OnBoardingModel(
      image: 'assets/images/onBoardingImage1.png',
      title: 'Discover Fashion Products',
      subTitle:
      'Explore a curated selection of stylish clothing, accessories, and more. Find your perfect look with ease and inspiration.',
      imageAlignment: Alignment.topLeft,
      selectedColor: const Color(0xFF6B4EFF),
      unSelectedColor: Colors.grey,
    ),
    OnBoardingModel(
      image: 'assets/images/onBoardingImage2.png',
      title: 'Smart Search Made Easy',
      subTitle:
      'Find fashion items instantly by text or voice. Enjoy fast, intuitive browsing tailored to your style.',
      imageAlignment: Alignment.center,
      selectedColor: Colors.red,
      unSelectedColor: Colors.white,
    ),
    OnBoardingModel(
      image: 'assets/images/onBoardingImage3.png',
      title: 'Seamless Online Shopping',
      subTitle:
      'Order your favorite fashion items easily with secure payments, fast delivery, and a smooth checkout.',
      imageAlignment: Alignment.centerRight,
      selectedColor: Colors.black,
      unSelectedColor: Colors.grey,
    ),
  ];

  void _goNext() {
    if (currentIndex < pages.length - 1) {
      controller.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    } else {
      Navigator.of(context).pushReplacementNamed(LogInView.routeName);
    }
  }

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      controller: controller,
      itemCount: pages.length,
      onPageChanged: (index) {
        setState(() => currentIndex = index);
      },
      itemBuilder: (context, index) {
        return OnBoardingPage(
          model: pages[index],
          index: index,
          currentIndex: currentIndex,
          onNext: _goNext,
        );
      },
    );
  }
}
