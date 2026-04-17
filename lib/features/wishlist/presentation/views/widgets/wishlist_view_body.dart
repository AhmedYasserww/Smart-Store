import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_store/features/wishlist/presentation/manager/get_wishlist_cubit/get_wishlist_cubit.dart';
import 'package:smart_store/features/wishlist/presentation/views/widgets/custom_empty_wishlist.dart';
import 'package:smart_store/features/wishlist/presentation/views/widgets/wishlist_grid_view.dart';
import '../../../../../core/utils/app_dimensions.dart';
import '../../../../../core/widgets/custom_loading_indicator.dart';

class WishlistViewBody extends StatelessWidget {
  const WishlistViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetWishlistCubit, GetWishlistState>(
      builder: (context, state) {
        if (state is GetWishlistLoading || state is GetWishlistInitial) {
          return const CustomLoadingIndicator();
        }

        if (state is GetWishlistFailure) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(Icons.error_outline, size: 48, color: Colors.red),
                const SizedBox(height: 12),
                Text(state.errorMessage),
                const SizedBox(height: 16),
                ElevatedButton(
                  onPressed: () =>
                      context.read<GetWishlistCubit>().getWishlist(),
                  child: const Text('Try Again'),
                ),
              ],
            ),
          );
        }

        if (state is GetWishlistSuccess) {
          final items = state.wishlist.items;

          if (items.isEmpty) {
            return const CustomEmptyWishlist();
          }

          return Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: AppDimensions.homeScreenPadding,
            ),
            child: Column(
              children: [
                const SizedBox(height: 32),
                Expanded(child: WishlistGrid(items: items)),
              ],
            ),
          );
        }

        return const SizedBox();
      },
    );
  }
}