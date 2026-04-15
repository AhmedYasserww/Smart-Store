part of 'delete_cart_item_cubit.dart';

@immutable
sealed class DeleteCartItemState {}

class DeleteCartItemInitial extends DeleteCartItemState {}
class DeleteCartItemLoading extends DeleteCartItemState {}
class DeleteCartItemSuccess extends DeleteCartItemState {}
class DeleteCartItemFailure extends DeleteCartItemState {
  final String errorMessage;
  DeleteCartItemFailure({required this.errorMessage});
}