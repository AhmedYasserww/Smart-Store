// features/delivery/presentation/manager/get_addresses_cubit/get_addresses_cubit.dart

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import '../../../data/entities/delivery_address_entity.dart';
import '../../../data/repos/delivery_repo.dart';

part 'get_addresses_state.dart';

class GetAddressesCubit extends Cubit<GetAddressesState> {
  final DeliveryRepo deliveryRepo;

  GetAddressesCubit(this.deliveryRepo) : super(GetAddressesInitial());

  Future<void> getAddresses() async {
    emit(GetAddressesLoading());
    final result = await deliveryRepo.getAddresses();
    result.fold(
          (failure) => emit(GetAddressesFailure(errorMessage: failure.errorMessage)),
          (addresses) => emit(GetAddressesSuccess(addresses: addresses)),
    );
  }
}