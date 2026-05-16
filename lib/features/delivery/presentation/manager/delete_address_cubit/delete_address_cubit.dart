// features/delivery/presentation/manager/delete_address_cubit/delete_address_cubit.dart
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import '../../../data/entities/delivery_address_entity.dart';
import '../../../data/repos/delivery_repo.dart';

part 'delete_address_state.dart';

class DeleteAddressCubit extends Cubit<DeleteAddressState> {
  final DeliveryRepo deliveryRepo;

  DeleteAddressCubit(this.deliveryRepo) : super(DeleteAddressInitial());

  Future<void> deleteAddress({
    required String addressId,
    required DeliveryAddressEntity address,
  }) async {
    emit(DeleteAddressLoading(addressId: addressId));
    final result = await deliveryRepo.deleteAddress(addressId: addressId);
    result.fold(
          (failure) => emit(DeleteAddressFailure(errorMessage: failure.errorMessage)),
          (_) => emit(DeleteAddressSuccess(
        addressId: addressId,
        address: address,
      )),
    );
  }
}