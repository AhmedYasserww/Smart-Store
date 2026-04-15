
part of 'get_cart_cubit.dart';

@immutable
sealed class GetCartState {}

class GetCartInitial extends GetCartState {}

class GetCartLoading extends GetCartState {}

class GetCartSuccess extends GetCartState {
  final GetCartEntity cart;
  GetCartSuccess({required this.cart});
}

class GetCartFailure extends GetCartState {
  final String errorMessage;
  GetCartFailure({required this.errorMessage});
}