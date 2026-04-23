part of 'create_order_cubit.dart';

@immutable
sealed class CreateOrderState {}

class CreateOrderInitial extends CreateOrderState {}
class CreateOrderLoading extends CreateOrderState {}

class CreateOrderSuccess extends CreateOrderState {
  final CreateOrderEntity order;
  CreateOrderSuccess({required this.order});
}

class CreateOrderFailure extends CreateOrderState {
  final String errorMessage;
  CreateOrderFailure({required this.errorMessage});
}