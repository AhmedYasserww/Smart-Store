//
// import 'package:bloc/bloc.dart';
// import 'package:meta/meta.dart';
// import '../../../data/repos/wishlist_repo.dart';
// import '../get_wishlist_cubit/get_wishlist_cubit.dart';
//
// part 'remove_from_wishlist_state.dart';
//
// class RemoveFromWishlistCubit extends Cubit<RemoveFromWishlistState> {
//   final WishlistRepo wishlistRepo;
//   final GetWishlistCubit getWishlistCubit;
//
//   RemoveFromWishlistCubit({
//     required this.wishlistRepo,
//     required this.getWishlistCubit,
//   }) : super(RemoveFromWishlistInitial());
//
//   Future<void> removeFromWishlist({required String itemId}) async {
//     emit(RemoveFromWishlistLoading(itemId: itemId));
//
//     // ✅ local update فوري
//     getWishlistCubit.removeItemLocally(itemId);
//
//     final result = await wishlistRepo.removeFromWishlist(itemId: itemId);
//     result.fold(
//           (failure) {
//         // لو فشل نعمل refresh عشان نرجع الـ state الصح
//         getWishlistCubit.getWishlist();
//         emit(RemoveFromWishlistFailure(errorMessage: failure.errorMessage));
//       },
//           (_) => emit(RemoveFromWishlistSuccess()),
//     );
//   }
// }