
part of 'update_cart_item_cubit.dart';

@immutable
sealed class UpdateCartItemState {}

class UpdateCartItemInitial extends UpdateCartItemState {}

class UpdateCartItemLoading extends UpdateCartItemState {
  final String cartItemId;
  UpdateCartItemLoading({required this.cartItemId});
}

class UpdateCartItemSuccess extends UpdateCartItemState {}

class UpdateCartItemFailure extends UpdateCartItemState {
  final String errorMessage;
  UpdateCartItemFailure({required this.errorMessage});
}