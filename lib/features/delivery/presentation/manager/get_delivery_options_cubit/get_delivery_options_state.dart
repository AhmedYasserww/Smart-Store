part of 'get_delivery_options_cubit.dart';


@immutable
sealed class GetDeliveryOptionsState {}

class GetDeliveryOptionsInitial extends GetDeliveryOptionsState {}
class GetDeliveryOptionsLoading extends GetDeliveryOptionsState {}

class GetDeliveryOptionsSuccess extends GetDeliveryOptionsState {
  final List<DeliveryOptionEntity> options;
  GetDeliveryOptionsSuccess({required this.options});
}

class GetDeliveryOptionsFailure extends GetDeliveryOptionsState {
  final String errorMessage;
  GetDeliveryOptionsFailure({required this.errorMessage});
}