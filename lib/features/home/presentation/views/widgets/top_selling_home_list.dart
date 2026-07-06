import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_store/core/widgets/custom_loading_indicator.dart';
import 'package:smart_store/features/home/presentation/top_selling_cubit/top_selling_home_cubit.dart';
import 'package:smart_store/features/home/presentation/views/widgets/recently_viewed_product_card.dart';
import '../../../../../core/utils/app_style.dart';

class TopSellingHomeList extends StatelessWidget {
  const TopSellingHomeList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TopSellingHomeCubit, TopSellingHomeState>(
      builder: (context, state) {
        if (state is TopSellingHomeLoading) {
          return const SizedBox(height: 180, child: CustomLoadingIndicator());
        }

        if (state is TopSellingHomeFailure) {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 8),
            child: Text(state.errMessage, style: AppStyle.styleGreyRegular14),
          );
        }

        if (state is TopSellingHomeSuccess) {
          if (state.products.isEmpty) {
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 8),
              child: Text(
                'No recently viewed products yet.',
                style: AppStyle.styleGreyRegular14,
              ),
            );
          }

          return SizedBox(
            height: 270,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemCount: state.products.length,
              separatorBuilder: (_, _) => const SizedBox(width: 12),
              itemBuilder: (_, index) {
                return RecentlyViewedProductCard(
                  productModel: state.products[index],
                );
              },
            ),
          );
        }

        return const SizedBox.shrink();
      },
    );
  }
}
