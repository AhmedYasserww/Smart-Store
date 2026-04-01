import 'package:flutter/material.dart';
import 'package:smart_store/features/home/presentation/views/widgets/product_card.dart';

import '../../../../products/data/models/product_model.dart';
class SearchItem extends StatelessWidget {
  const SearchItem ({super.key, this.productModel});
  final ProductModel? productModel;

  @override
  Widget build(BuildContext context) {
    return ProductCard(productModel: productModel!);
  }
}
