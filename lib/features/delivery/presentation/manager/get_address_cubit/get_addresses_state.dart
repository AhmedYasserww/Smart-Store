part of 'get_addresses_cubit.dart';

@immutable
sealed class GetAddressesState {}

class GetAddressesInitial extends GetAddressesState {}
class GetAddressesLoading extends GetAddressesState {}

class GetAddressesSuccess extends GetAddressesState {
  final List<DeliveryAddressEntity> addresses;
  GetAddressesSuccess({required this.addresses});
}

class GetAddressesFailure extends GetAddressesState {
  final String errorMessage;
  GetAddressesFailure({required this.errorMessage});
}