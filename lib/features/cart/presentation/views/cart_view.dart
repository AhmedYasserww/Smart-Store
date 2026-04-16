import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_store/features/cart/presentation/views/widgets/cart_view_body.dart';

import '../../../../core/service_locator/service_locator.dart';
import '../../../../core/utils/app_color.dart';
import '../../../../core/utils/app_style.dart';
import '../../data/repos/cart_repo_imp.dart';
import '../manager/delete_cart_item_cubit/delete_cart_item_cubit.dart';
import '../manager/get_cart_cubit/get_cart_cubit.dart';
import '../manager/update_cart_item_cubit/update_cart_item_cubit.dart';

class CartView extends StatelessWidget {
  const CartView({super.key});
  static const String routeName = 'cart_view';

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => GetCartCubit(getIt.get<CartRepoImpl>())..getCart(),
      child: Builder(
        builder: (context) => MultiBlocProvider(
          providers: [
            BlocProvider(
              create: (_) => DeleteCartItemCubit(
                cartRepo: getIt<CartRepoImpl>(),
                getCartCubit: context.read<GetCartCubit>(),
              ),
            ),
            BlocProvider(
              create: (_) => UpdateCartItemCubit(
                cartRepo: getIt<CartRepoImpl>(),
                getCartCubit: context.read<GetCartCubit>(),
              ),
            ),
          ],
          child: Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.white,
              centerTitle: true,
              elevation: 0,
              surfaceTintColor: Colors.transparent,
              scrolledUnderElevation: 0,
              title: Text('My cart', style: AppStyle.styleSemiBold20),
              bottom: const PreferredSize(
                preferredSize: Size.fromHeight(1),
                child: Divider(height: 1, thickness: 1, color: AppColors.palletBorderColor),
              ),
            ),
            body: const CartViewBody(),
          ),
        ),
      ),
    );
  }
}
