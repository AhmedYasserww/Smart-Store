import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_store/features/products/presentation/views/widgets/product_view_widgets/product_view_body.dart';

import '../../../../core/utils/app_color.dart';
import '../../../../core/utils/app_style.dart';
import '../../../home/presentation/views/widgets/home_view_body.dart';
import '../../data/product_or_list_cubit/product_or_list_cubit.dart';
class ProductView extends StatelessWidget {
  const ProductView({super.key});
  static const String routeName = 'product_view';

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProductOrListCubit()..changeUi(true),
      child: Scaffold(
        appBar: AppBar(
            backgroundColor: Colors.white,
            centerTitle: true,
            elevation: 0,
            surfaceTintColor: Colors.transparent,
            scrolledUnderElevation: 0,
          title: Text("Product", style: AppStyle.styleSemiBold20),

        ),
        body: ProductViewBody(),
      ),
    );
  }
}
