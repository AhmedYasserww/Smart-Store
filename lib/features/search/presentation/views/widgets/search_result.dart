import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_store/core/utils/app_dimensions.dart';
import 'package:smart_store/features/search/presentation/views/widgets/custom_empty_or_failure_result.dart';
import '../../../../../core/utils/app_images.dart';
import '../../../../../core/utils/app_style.dart';
import '../../manager/search_for_product_cubit/search_for_product_cubit.dart';
import 'search_item_grid_view.dart';

class SearchResults extends StatelessWidget {
  const SearchResults({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchForProductCubit, SearchForProductState>(
      builder: (context, state) {

        /// 🔹 Loading
        if (state is SearchForProductLoading) {
          return const Center(child: CircularProgressIndicator());
        }

        /// 🔹 Failure
        else if (state is SearchForProductFailure) {
          return Center(
            child: Text(state.errorMessage),
          );
        }

        else if (state is SearchForProductSuccess) {
          if (state.product.isEmpty) {
            final query =
                context.read<SearchForProductCubit>().lastQuery;

            return Center(
              child: CustomEmptyOrFailureResult(
                image: AppImages.failureResultIcon,
                title: "No Results found",

                /// 🔥 RichText
                richSubtitle: TextSpan(
                  children: [
                    TextSpan(
                      text: "We couldn't find any products matching ",
                      style: AppStyle.styleGreyRegular16,
                    ),
                    TextSpan(
                      text: '"$query"',
                      style: AppStyle.styleRegular16,
                    ),
                    TextSpan(
                      text: ". Try searching with different keywords.",
                      style: AppStyle.styleGreyRegular16,
                    ),
                  ],
                ),
              ),
            );
          }

          final query =
              context.read<SearchForProductCubit>().lastQuery;

          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding:  EdgeInsets.symmetric(horizontal: AppDimensions.homeScreenPadding),
                child: Row(
                  children: [
                    Text(
                      'Found',
                      style: AppStyle.styleGreyRegular14,
                    ),
                    Text(
                      ' ${state.product.length} ',
                      style: AppStyle.styleRegular14,
                    ),
                    Text(
                      ' results of ',
                      style: AppStyle.styleGreyRegular14,
                    ),
                    Text(
                      ' "$query"',
                      style: AppStyle.styleRegular14,
                    ),
                  ],
                ),
              ),
              SizedBox(height: 16,),

              Expanded(
                child: SearchItemGridView(
                  products: state.product,
                ),
              ),
            ],
          );
        }

        /// 🔹 Initial
        return const Center(
          child: CustomEmptyOrFailureResult(image:AppImages.searchIcon,
              title: "Start Your Search",
              subtitle:"Smart search that understands what you mean — not just what you type."
          ),
        );
      },
    );
  }
}