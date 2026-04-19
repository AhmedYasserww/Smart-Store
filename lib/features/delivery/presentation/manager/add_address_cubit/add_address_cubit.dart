// features/delivery/presentation/manager/add_address_cubit/add_address_cubit.dart

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import '../../../data/entities/delivery_address_entity.dart';
import '../../../data/repos/delivery_repo.dart';

part 'add_address_state.dart';

class AddAddressCubit extends Cubit<AddAddressState> {
  final DeliveryRepo deliveryRepo;

  AddAddressCubit(this.deliveryRepo) : super(AddAddressInitial());

  Future<void> addAddress({
    required String fullName,
    required String phoneNumber,
    required String city,
    required String street,
    required String building,
    required String apartment,
    required String landmark,
    bool isDefault = false,
    double? latitude,
    double? longitude,
  }) async {
    emit(AddAddressLoading());

    final result = await deliveryRepo.addAddress(
      fullName: fullName,
      phoneNumber: phoneNumber,
      city: city,
      street: street,
      building: building,
      apartment: apartment,
      landmark: landmark,
      isDefault: isDefault,
      latitude: latitude,
      longitude: longitude,
    );

    result.fold(
          (failure) => emit(AddAddressFailure(errorMessage: failure.errorMessage)),
          (address) => emit(AddAddressSuccess(address: address)),
    );
  }
}