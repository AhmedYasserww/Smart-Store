import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:smart_store/core/utils/app_color.dart';
import 'package:smart_store/core/utils/app_images.dart'; // class AppImages
import 'package:smart_store/features/home/presentation/views/home_view.dart';
import 'package:smart_store/features/products/presentation/views/product_view.dart';
import 'package:smart_store/features/cart/presentation/views/cart_view.dart';

class CustomNavigationBar extends StatefulWidget {
  const CustomNavigationBar({super.key});
  static const String routeName = 'bottom-nav-bar';

  @override
  State<CustomNavigationBar> createState() => _CustomNavigationBarState();
}

class _CustomNavigationBarState extends State<CustomNavigationBar> {
  int selectedIndex = 0;

  final List<Widget> screens = const [
    HomeView(),
    ProductView(),
    CartView(),
    MoreView(),
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      child: Scaffold(
        backgroundColor: Colors.white,

        body: IndexedStack(
          index: selectedIndex,
          children: screens,
        ),

        bottomNavigationBar: Container(
          padding: EdgeInsets.symmetric(horizontal: 8),
       //   height: 77,
          decoration: BoxDecoration(
            color: Colors.grey.shade200,
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(32),
              topRight: Radius.circular(32),
            ),
            boxShadow: const [
              BoxShadow(
                color: Colors.black12,
                blurRadius: 6,
                offset: Offset(0, -2),
              ),
            ],
          ),

          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _navItem(0, "Home", AppImages.homeOutlined, AppImages.homeFilled),
              _navItem(1, "Product", AppImages.productOutlined, AppImages.productFilled),
              _navItem(2, "Cart", AppImages.cartOutlined, AppImages.cartFilled),
              _navItem(3, "More", AppImages.moreIcon, AppImages.moreIcon),
            ],
          ),
        ),
      ),
    );
  }
  Widget _navItem(int index, String title, String outlinedSvg, String filledSvg) {
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

            AnimatedContainer(
              duration: const Duration(milliseconds: 350),
              curve: Curves.easeInOut,
              child: Transform.translate(
                offset: selected ? const Offset(0, -16) : Offset.zero,
                child: selected
                    ? Container(
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
                  width: 24,
                  height: 24,
                  color: Colors.grey.shade600,
                ),
              ),
            ),

            const SizedBox(height: 4),

            Transform.translate(
              offset: selected ? const Offset(0, -12) : Offset.zero,
              child: Text(
                title,
                style: const TextStyle(
                  fontSize: 12,
                  color: AppColors.primaryTextColor,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class MoreView extends StatelessWidget {
  const MoreView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(child: Text("More View")),
    );
  }
}