part of 'remove_from_wishlist_cubit.dart';

@immutable
sealed class RemoveFromWishlistState {}

class RemoveFromWishlistInitial extends RemoveFromWishlistState {}

class RemoveFromWishlistLoading extends RemoveFromWishlistState {
  final String itemId;
  RemoveFromWishlistLoading({required this.itemId});
}

class RemoveFromWishlistSuccess extends RemoveFromWishlistState {}

class RemoveFromWishlistFailure extends RemoveFromWishlistState {
  final String errorMessage;
  RemoveFromWishlistFailure({required this.errorMessage});
}