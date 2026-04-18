
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import '../../../data/entities/wishlist_entity.dart';
import '../../../data/repos/wishlist_repo.dart';

part 'get_wishlist_state.dart';
class GetWishlistCubit extends Cubit<GetWishlistState> {
  final WishlistRepo wishlistRepo;

  GetWishlistCubit(this.wishlistRepo) : super(GetWishlistInitial());

  Future<void> getWishlist({bool silent = false}) async {
    if (!silent) emit(GetWishlistLoading());

    final result = await wishlistRepo.getWishlist();
    result.fold(
          (failure) => emit(GetWishlistFailure(errorMessage: failure.errorMessage)),
          (wishlist) => emit(GetWishlistSuccess(wishlist: wishlist)),
    );
  }

  Future<void> toggleFavorite(String productId) async {
    if (_isLoading) return;
    _isLoading = true;

    try {
      final currentState = state;
      if (currentState is! GetWishlistSuccess) return;

      final itemId = getWishlistItemId(productId);
      final alreadyFavorite = itemId != null;

      if (alreadyFavorite) {
        await wishlistRepo.removeFromWishlist(itemId: itemId);
        await getWishlist(silent: true);
      } else {
        await wishlistRepo.addToWishlist(productId: productId);
        await getWishlist(silent: true);
      }
    } finally {
      _isLoading = false;
    }
  }


  // ✅ أي widget يسأل بـ productId
  bool isFavorite(String productId) {
    final currentState = state;
    if (currentState is! GetWishlistSuccess) return false;
    return currentState.wishlist.items
        .any((item) => item.product.id == productId);
  }

  // ✅ جيب الـ wishlist item id بالـ productId
  String? getWishlistItemId(String productId) {
    final currentState = state;
    if (currentState is! GetWishlistSuccess) return null;
    try {
      return currentState.wishlist.items
          .firstWhere((item) => item.product.id == productId)
          .id;
    } catch (_) {
      return null;
    }
  }

  bool _isLoading = false;


  // void removeItemLocally(String itemId) {
  //   final currentState = state;
  //   if (currentState is! GetWishlistSuccess) return;
  //
  //   final updatedItems = currentState.wishlist.items
  //       .where((item) => item.id != itemId)
  //       .toList();
  //
  //   emit(GetWishlistSuccess(
  //     wishlist: WishlistModel(
  //       id: currentState.wishlist.id,
  //       clientId: currentState.wishlist.clientId,
  //       createdAt: currentState.wishlist.createdAt,
  //       lastUpdated: currentState.wishlist.lastUpdated,
  //       items: updatedItems,
  //     ),
  //   ));
  // }
}