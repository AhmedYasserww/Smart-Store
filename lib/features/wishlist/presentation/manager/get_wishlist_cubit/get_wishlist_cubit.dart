
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import '../../../data/entities/wishlist_entity.dart';
import '../../../data/models/wishlist_model.dart';
import '../../../data/repos/wishlist_repo.dart';

part 'get_wishlist_state.dart';

class GetWishlistCubit extends Cubit<GetWishlistState> {
  final WishlistRepo wishlistRepo;

  GetWishlistCubit(this.wishlistRepo) : super(GetWishlistInitial());

  Future<void> getWishlist() async {
    emit(GetWishlistLoading());
    final result = await wishlistRepo.getWishlist();
    result.fold(
          (failure) => emit(GetWishlistFailure(errorMessage: failure.errorMessage)),
          (wishlist) => emit(GetWishlistSuccess(wishlist: wishlist)),
    );
  }

  void removeItemLocally(String itemId) {
    final currentState = state;
    if (currentState is! GetWishlistSuccess) return;

    final updatedItems = currentState.wishlist.items
        .where((item) => item.id != itemId)
        .toList();

    final updatedWishlist = WishlistModel(
      id: currentState.wishlist.id,
      clientId: currentState.wishlist.clientId,
      createdAt: currentState.wishlist.createdAt,
      lastUpdated: currentState.wishlist.lastUpdated,
      items: updatedItems,
    );

    emit(GetWishlistSuccess(wishlist: updatedWishlist));
  }
}