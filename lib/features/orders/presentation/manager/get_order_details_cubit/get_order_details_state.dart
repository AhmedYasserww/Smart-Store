// get_order_details_state.dart
part of 'get_order_details_cubit.dart';

@immutable
sealed class GetOrderDetailsState {}

class GetOrderDetailsInitial extends GetOrderDetailsState {}
class GetOrderDetailsLoading extends GetOrderDetailsState {}

class GetOrderDetailsSuccess extends GetOrderDetailsState {
  final OrderDetailsEntity order;
  GetOrderDetailsSuccess({required this.order});
}

class GetOrderDetailsFailure extends GetOrderDetailsState {
  final String errorMessage;
  GetOrderDetailsFailure({required this.errorMessage});
}