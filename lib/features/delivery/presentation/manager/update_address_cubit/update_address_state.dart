part of 'update_address_cubit.dart';

@immutable
sealed class UpdateAddressState {}

class UpdateAddressInitial extends UpdateAddressState {}
class UpdateAddressLoading extends UpdateAddressState {}

class UpdateAddressSuccess extends UpdateAddressState {
  final DeliveryAddressEntity address;
  UpdateAddressSuccess({required this.address});
}

class UpdateAddressFailure extends UpdateAddressState {
  final String errorMessage;
  UpdateAddressFailure({required this.errorMessage});
}