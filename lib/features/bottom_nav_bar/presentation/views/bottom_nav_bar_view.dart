import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:smart_store/core/utils/app_color.dart';
import 'package:smart_store/core/utils/app_images.dart';
import 'package:smart_store/features/cart/presentation/views/cart_view.dart';
import 'package:smart_store/features/home/presentation/views/home_view.dart';
import 'package:smart_store/features/products/presentation/views/product_view.dart';

import '../../../profile/presentation/views/profile_view.dart';

class CustomNavigationBar extends StatefulWidget {
  const CustomNavigationBar({super.key});
  static const String routeName = 'bottom-nav-bar';

  @override
  State<CustomNavigationBar> createState() => _CustomNavigationBarState();
}

class _CustomNavigationBarState extends State<CustomNavigationBar> {
  int selectedIndex = 0;

  static const List<Color> _navBackgrounds = [
    Color(0xFFF6F7FB),
    Color(0xFFF3F7FF),
    Color(0xFFF9F6FF),
    Color(0xFFF6FBF9),
  ];

  final List<Widget> screens = const [
    HomeView(),
    ProductView(),
    CartView(),
    ProfileView(),
  ];

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: selectedIndex == 0,
      onPopInvokedWithResult: (didPop, result) {
        if (!didPop && selectedIndex != 0) {
          setState(() {
            selectedIndex = 0;
          });
        }
      },
      child: SafeArea(
        top: false,
        child: Scaffold(
          backgroundColor: Colors.white,

          body: IndexedStack(index: selectedIndex, children: screens),
          bottomNavigationBar: AnimatedContainer(
            duration: const Duration(milliseconds: 380),
            curve: Curves.easeOutCubic,
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
            decoration: BoxDecoration(
              color: _navBackgrounds[selectedIndex],
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(32),
                topRight: Radius.circular(32),
              ),
              border: Border(
                top: BorderSide(
                  color: AppColors.primaryColor.withValues(alpha: 0.08),
                ),
              ),
              boxShadow: [
                BoxShadow(
                  color: AppColors.primaryColor.withValues(alpha: 0.10),
                  blurRadius: 26,
                  spreadRadius: 1,
                  offset: const Offset(0, -7),
                ),
                BoxShadow(
                  color: Colors.black.withValues(alpha: 0.06),
                  blurRadius: 12,
                  offset: const Offset(0, -2),
                ),
              ],
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _navItem(
                  0,
                  "Home",
                  AppImages.homeOutlined,
                  AppImages.homeFilled,
                ),
                _navItem(
                  1,
                  "Product",
                  AppImages.productOutlined,
                  AppImages.productFilled,
                ),
                _navItem(
                  2,
                  "Cart",
                  AppImages.cartOutlined,
                  AppImages.cartFilled,
                ),
                _navItem(3, "More", AppImages.moreIcon, AppImages.moreIcon),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _navItem(
    int index,
    String title,
    String outlinedSvg,
    String filledSvg,
  ) {
    bool selected = index == selectedIndex;

    return Expanded(
      child: InkWell(
        onTap: () => setState(() => selectedIndex = index),
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AnimatedSlide(
              duration: const Duration(milliseconds: 320),
              curve: Curves.easeOutBack,
              offset: selected ? const Offset(0, -0.30) : Offset.zero,
              child: AnimatedScale(
                duration: const Duration(milliseconds: 280),
                curve: Curves.easeOutCubic,
                scale: selected ? 1.06 : 1,
                child: AnimatedSwitcher(
                  duration: const Duration(milliseconds: 240),
                  switchInCurve: Curves.easeOut,
                  switchOutCurve: Curves.easeIn,
                  transitionBuilder: (child, animation) {
                    return ScaleTransition(
                      scale: animation,
                      child: FadeTransition(opacity: animation, child: child),
                    );
                  },
                  child: selected
                      ? Container(
                          key: const ValueKey("selected"),
                          padding: const EdgeInsets.all(6),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            shape: BoxShape.circle,
                            boxShadow: [
                              BoxShadow(
                                color: AppColors.primaryColor.withValues(
                                  alpha: 0.22,
                                ),
                                blurRadius: 14,
                                offset: const Offset(0, 6),
                              ),
                            ],
                          ),
                          child: CircleAvatar(
                            radius: 18,
                            backgroundColor: AppColors.primaryColor,
                            child: SvgPicture.asset(
                              filledSvg,
                              width: 28,
                              height: 28,
                              colorFilter: const ColorFilter.mode(
                                Colors.white,
                                BlendMode.srcIn,
                              ),
                            ),
                          ),
                        )
                      : SvgPicture.asset(
                          outlinedSvg,
                          key: const ValueKey("normal"),
                          width: 24,
                          height: 24,
                          colorFilter: ColorFilter.mode(
                            Colors.grey.shade600,
                            BlendMode.srcIn,
                          ),
                        ),
                ),
              ),
            ),

            const SizedBox(height: 4),

            AnimatedSlide(
              duration: const Duration(milliseconds: 280),
              curve: Curves.easeOut,
              offset: selected ? const Offset(0, -0.5) : Offset.zero,
              child: AnimatedDefaultTextStyle(
                duration: const Duration(milliseconds: 260),
                curve: Curves.easeOut,
                style: TextStyle(
                  fontSize: selected ? 12.5 : 12,
                  fontWeight: selected ? FontWeight.w700 : FontWeight.w500,
                  color: selected
                      ? AppColors.primaryColor
                      : AppColors.primaryTextColor,
                ),
                child: Text(title),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// class MoreView extends StatelessWidget {
//   const MoreView({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return const Scaffold(
//       body: Center(child: Text("More View")),
//     );
//   }
// }
/*
Widget _navItem(int index, String title, String outlinedSvg, String filledSvg) {
  bool selected = index == selectedIndex;

  return Expanded(
    child: InkWell(
      onTap: () => setState(() => selectedIndex = index),
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [

          TweenAnimationBuilder<double>(
            tween: Tween(
              begin: selected ? 0 : -16,
              end: selected ? -16 : 0,
            ),
            duration: const Duration(milliseconds: 600),
            curve: Curves.easeOutBack, // كيرف واضح
            builder: (context, value, child) {
              return Transform.translate(
                offset: Offset(0, value),
                child: child,
              );
            },

            child: AnimatedSwitcher(
              duration: const Duration(milliseconds: 400),
              transitionBuilder: (child, animation) {

                return ScaleTransition(
                  scale: animation,
                  child: FadeTransition(
                    opacity: animation,
                    child: child,
                  ),
                );
              },

              child: selected
                  ? Container(
                key: const ValueKey("selected"),

                padding: const EdgeInsets.all(6),

                decoration: const BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                ),

                child: CircleAvatar(
                  radius: 18,
                  backgroundColor: AppColors.primaryColor,

                  child: SvgPicture.asset(
                    filledSvg,
                    width: 28,
                    height: 28,
                    color: Colors.white,
                  ),
                ),
              )
                  : SvgPicture.asset(
                outlinedSvg,
                key: const ValueKey("normal"),

                width: 24,
                height: 24,

                color: Colors.grey.shade600,
              ),
            ),
          ),

          const SizedBox(height: 6),

          AnimatedDefaultTextStyle(
            duration: const Duration(milliseconds: 400),
            curve: Curves.easeOut,

            style: TextStyle(
              fontSize: selected ? 13 : 12,
              fontWeight:
              selected ? FontWeight.bold : FontWeight.normal,
              color: AppColors.primaryTextColor,
            ),

            child: Text(title),
          ),
        ],
      ),
    ),
  );
}
 */
