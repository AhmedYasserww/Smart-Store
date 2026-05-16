part of 'delete_address_cubit.dart';

@immutable
sealed class DeleteAddressState {}

class DeleteAddressInitial extends DeleteAddressState {}

class DeleteAddressLoading extends DeleteAddressState {
  final String addressId;
  DeleteAddressLoading({required this.addressId});
}

class DeleteAddressSuccess extends DeleteAddressState {
  final String addressId;
  final DeliveryAddressEntity address;
  DeleteAddressSuccess({
    required this.addressId,
    required this.address,
  });
}

class DeleteAddressFailure extends DeleteAddressState {
  final String errorMessage;
  DeleteAddressFailure({required this.errorMessage});
}