import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_store/features/products/data/repos/product_repo_imp.dart';
import 'package:smart_store/features/products/presentation/views/widgets/product_view_widgets/product_view_body.dart';
import '../../../../core/service_locator/service_locator.dart';
import '../../../../core/utils/app_style.dart';
import '../../data/product_or_list_cubit/product_or_list_cubit.dart';
import '../manager/get_all_product_cubit.dart';

class ProductView extends StatelessWidget {
  const ProductView({super.key});
  static const String routeName = 'product_view';

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<ProductOrListCubit>(
          create: (_) => ProductOrListCubit()..changeUi(true),
        ),
       BlocProvider(
           create: (_) => GetAllProductCubit(getIt.get<ProductsRepoImpl>())..fetchAllProducts(),
       ),
      ],
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          centerTitle: true,
          elevation: 0,
          surfaceTintColor: Colors.transparent,
          scrolledUnderElevation: 0,
          title: Text("Product", style: AppStyle.styleSemiBold20),
        ),
        body: const ProductViewBody(),
      ),
    );
  }
}