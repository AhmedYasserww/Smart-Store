
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import '../../../data/repos/wishlist_repo.dart';
import '../get_wishlist_cubit/get_wishlist_cubit.dart';

part 'add_to_wishlist_state.dart';

class AddToWishlistCubit extends Cubit<AddToWishlistState> {
  final WishlistRepo wishlistRepo;
  final GetWishlistCubit getWishlistCubit;

  AddToWishlistCubit({
    required this.wishlistRepo,
    required this.getWishlistCubit,
  }) : super(AddToWishlistInitial());

  Future<void> addToWishlist({required String productId}) async {
    emit(AddToWishlistLoading());
    final result = await wishlistRepo.addToWishlist(productId: productId);
    result.fold(
          (failure) => emit(AddToWishlistFailure(errorMessage: failure.errorMessage)),
          (_) async {
        emit(AddToWishlistSuccess());
        await getWishlistCubit.getWishlist();
      },
    );
  }
}