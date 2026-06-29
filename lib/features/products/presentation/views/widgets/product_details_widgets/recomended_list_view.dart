import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_store/core/widgets/custom_cached_network_image.dart';
import 'package:smart_store/core/widgets/custom_loading_indicator.dart';
import 'package:smart_store/features/products/presentation/manager/get_recommendations_cubit/get_recommendations_cubit.dart';
import 'package:smart_store/features/products/presentation/views/product_details_view.dart';
import '../../../../../../core/utils/app_style.dart';

class RecommendedList extends StatelessWidget {
  const RecommendedList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetRecommendationsCubit, GetRecommendationsState>(
      builder: (context, state) {
        if (state is GetRecommendationsLoading) {
          return CustomLoadingIndicator();
        }

        if (state is GetRecommendationsFailure || state is GetRecommendationsInitial) {
          return const SizedBox();
        }

        if (state is GetRecommendationsSuccess) {
          if (state.recommendations.isEmpty) return const SizedBox();

          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Recommended to you', style: AppStyle.styleSemiBold18),
              const SizedBox(height: 16),
              SizedBox(
                height: 90,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemCount: state.recommendations.length,
                  separatorBuilder: (_, __) => const SizedBox(width: 16),
                  itemBuilder: (_, index) {
                    final rec = state.recommendations[index];
                    return GestureDetector(
                      onTap: () {
                        Navigator.of(context).pushNamed(
                          ProductDetailsView.routeName,
                          arguments: rec.id,
                        );
                      },
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: CustomCachedNetworkImage(
                          path: rec.imageUrl,
                          width: 80,
                          height: 90,
                          fit: BoxFit.cover,
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          );
        }

        return const SizedBox();
      },
    );
  }
}