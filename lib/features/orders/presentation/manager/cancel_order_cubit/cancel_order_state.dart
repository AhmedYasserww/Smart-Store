// cancel_order_state.dart
part of 'cancel_order_cubit.dart';

@immutable
sealed class CancelOrderState {}
class CancelOrderInitial extends CancelOrderState {}
class CancelOrderLoading extends CancelOrderState {}
class CancelOrderSuccess extends CancelOrderState {
  final String message;
  CancelOrderSuccess({required this.message});
}
class CancelOrderFailure extends CancelOrderState {
  final String errorMessage;
  CancelOrderFailure({required this.errorMessage});
}