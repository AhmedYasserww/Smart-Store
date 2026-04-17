
part of 'get_wishlist_cubit.dart';

@immutable
sealed class GetWishlistState {}

class GetWishlistInitial extends GetWishlistState {}
class GetWishlistLoading extends GetWishlistState {}

class GetWishlistSuccess extends GetWishlistState {
  final WishlistEntity wishlist;
  GetWishlistSuccess({required this.wishlist});
}

class GetWishlistFailure extends GetWishlistState {
  final String errorMessage;
  GetWishlistFailure({required this.errorMessage});
}