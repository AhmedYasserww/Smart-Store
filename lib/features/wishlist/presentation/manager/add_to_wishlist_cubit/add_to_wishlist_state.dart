part of 'add_to_wishlist_cubit.dart';

@immutable
sealed class AddToWishlistState {}

class AddToWishlistInitial extends AddToWishlistState {}
class AddToWishlistLoading extends AddToWishlistState {}
class AddToWishlistSuccess extends AddToWishlistState {}

class AddToWishlistFailure extends AddToWishlistState {
  final String errorMessage;
  AddToWishlistFailure({required this.errorMessage});
}