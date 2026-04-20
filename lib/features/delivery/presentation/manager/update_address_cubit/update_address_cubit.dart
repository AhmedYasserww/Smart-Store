// features/delivery/presentation/manager/update_address_cubit/update_address_cubit.dart

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import '../../../data/entities/delivery_address_entity.dart';
import '../../../data/entities/add_address_request_entity.dart';
import '../../../data/repos/delivery_repo.dart';

part 'update_address_state.dart';

class UpdateAddressCubit extends Cubit<UpdateAddressState> {
  final DeliveryRepo deliveryRepo;

  UpdateAddressCubit(this.deliveryRepo) : super(UpdateAddressInitial());

  Future<void> updateAddress({
    required String addressId,
    required AddAddressRequestEntity request,
  }) async {
    emit(UpdateAddressLoading());

    final result = await deliveryRepo.updateAddress(
      addressId: addressId,
      request: request,
    );

    result.fold(
          (failure) => emit(UpdateAddressFailure(errorMessage: failure.errorMessage)),
          (address) => emit(UpdateAddressSuccess(address: address)),
    );
  }
}