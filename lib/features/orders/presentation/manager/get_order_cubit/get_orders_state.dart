// get_orders_state.dart
part of 'get_orders_cubit.dart';

@immutable
sealed class GetOrdersState {}
class GetOrdersInitial extends GetOrdersState {}
class GetOrdersLoading extends GetOrdersState {}
class GetOrdersSuccess extends GetOrdersState {
  final OrdersResponseEntity orders;
  GetOrdersSuccess({required this.orders});
}
class GetOrdersFailure extends GetOrdersState {
  final String errorMessage;
  GetOrdersFailure({required this.errorMessage});
}