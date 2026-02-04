import 'package:flutter/material.dart';
import 'package:smart_store/features/home/presentation/views/widgets/product_card.dart';
class ProductListview extends StatelessWidget {
  const ProductListview({super.key});
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 256,
      child: ListView.separated(
        padding: const EdgeInsets.only(bottom: 8),
        scrollDirection: Axis.horizontal,

        itemBuilder: (context, index) => const ProductCard(),
        separatorBuilder: (context, index) => const SizedBox(width: 22),
        itemCount: 10,
      ),
    );
  }
}
