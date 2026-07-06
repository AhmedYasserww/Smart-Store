import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_store/core/widgets/custom_loading_indicator.dart';
import 'package:smart_store/features/home/presentation/manager/highlights_home_cubit/highlights_home_cubit.dart';
import 'package:smart_store/features/home/presentation/views/widgets/recently_viewed_product_card.dart';
import '../../../../../core/utils/app_style.dart';

class HighlightsHomeList extends StatelessWidget {
  const HighlightsHomeList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HighlightsHomeCubit, HighlightsHomeState>(
      builder: (context, state) {
        if (state is HighlightsHomeLoading) {
          return const SizedBox(height: 180, child: CustomLoadingIndicator());
        }

        if (state is HighlightsHomeFailure) {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 8),
            child: Text(state.errMessage, style: AppStyle.styleGreyRegular14),
          );
        }

        if (state is HighlightsHomeSuccess) {
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
