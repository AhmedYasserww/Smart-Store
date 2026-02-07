import 'package:flutter/material.dart';
import 'package:smart_store/core/utils/app_color.dart';
import 'package:smart_store/features/products/presentation/views/product_view.dart';
import '../../../../core/utils/app_style.dart';
import '../../../cart/presentation/views/cart_view.dart';
import '../../../home/presentation/views/home_view.dart';
class CustomNavigationBar extends StatefulWidget {
  const CustomNavigationBar({super.key});
  static const String routeName = 'bottom-nav-bar';

  @override
  State<CustomNavigationBar> createState() => _CustomNavigationBarState();
}

class _CustomNavigationBarState extends State<CustomNavigationBar> {
  int currentIndex = 0;

  final List<Widget> items = const [
    HomeView(),
   ProductView(),
    CartView(),
    MoreView(),
  ];

  @override
  Widget build(BuildContext context) {
    final double bottomPadding = MediaQuery.of(context).padding.bottom;

    return Scaffold(
      body: IndexedStack(children: items, index: currentIndex),
      bottomNavigationBar: Container(
        color: Colors.white,
        width: double.infinity,
        padding: EdgeInsets.only(bottom: bottomPadding, top: 4),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _navItem(Icons.home_outlined, Icons.home, 'Home', 0),
            _navItem(Icons.category_outlined, Icons.category, 'Product', 1),
            _navItem(Icons.shopping_cart_outlined, Icons.shopping_cart, 'Cart', 2),
            _navItem(Icons.more_outlined, Icons.more_horiz, 'More', 3),
          ],
        ),
      ),
    );
  }

  Widget _navItem(IconData icon, IconData activeIcon, String label, int index) {
    bool isSelected = index == currentIndex;

    const double fixedWidth = 49.71; // عرض كلمة "Products"
    const double curveHeight = 9;

    return GestureDetector(
      onTap: () => setState(() => currentIndex = index),
      behavior: HitTestBehavior.translucent,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(isSelected ? activeIcon : icon, color: AppColors.primaryTextColor),
          const SizedBox(height: 4),
          Text(
            label,
            style: AppStyle.styleRegular12.copyWith(color: AppColors.primaryTextColor),
          ),
          const SizedBox(height: 2),
          if (isSelected)
            SizedBox(
              width: fixedWidth,
              height: curveHeight,
              child: CustomPaint(
                painter: _CurvePainter(color: const Color(0xFF1A1515)),
              ),
            ),
        ],
      ),
    );
  }

}

class _CurvePainter extends CustomPainter {
  final Color color;

  _CurvePainter({required this.color});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..style = PaintingStyle.fill;

    final double curveHeight = 9;

    final path = Path()
      ..moveTo(0, curveHeight)
      ..quadraticBezierTo(
        size.width / 2,
        -curveHeight,
        size.width,
        curveHeight,
      )
      ..lineTo(size.width, size.height)
      ..lineTo(0, size.height)
      ..close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

// ---------- Screens ----------


class MoreView extends StatelessWidget {
  const MoreView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(child: Text("More View")),
    );
  }
}
