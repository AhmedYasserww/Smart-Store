part of 'add_address_cubit.dart';

@immutable
sealed class AddAddressState {}

class AddAddressInitial extends AddAddressState {}
class AddAddressLoading extends AddAddressState {}

class AddAddressSuccess extends AddAddressState {
  final DeliveryAddressEntity address;
  AddAddressSuccess({required this.address});
}

class AddAddressFailure extends AddAddressState {
  final String errorMessage;
  AddAddressFailure({required this.errorMessage});
}