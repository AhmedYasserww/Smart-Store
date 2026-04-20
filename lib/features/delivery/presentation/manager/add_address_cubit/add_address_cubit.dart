// features/delivery/presentation/manager/add_address_cubit/add_address_cubit.dart

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import '../../../data/entities/add_address_request_entity.dart';
import '../../../data/entities/delivery_address_entity.dart';
import '../../../data/repos/delivery_repo.dart';

part 'add_address_state.dart';

class AddAddressCubit extends Cubit<AddAddressState> {
  final DeliveryRepo deliveryRepo;

  AddAddressCubit(this.deliveryRepo) : super(AddAddressInitial());

  Future<void> addAddress({required AddAddressRequestEntity request}) async {
    emit(AddAddressLoading());
    final result = await deliveryRepo.addAddress(request: request);
    result.fold(
          (failure) => emit(AddAddressFailure(errorMessage: failure.errorMessage)),
          (address) => emit(AddAddressSuccess(address: address)),
    );
  }
}