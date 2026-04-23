import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import '../../../data/entities/delivery_option_entity.dart';
import '../../../data/repos/delivery_repo.dart';

part 'get_delivery_options_state.dart';

class GetDeliveryOptionsCubit extends Cubit<GetDeliveryOptionsState> {
  final DeliveryRepo deliveryRepo;

  GetDeliveryOptionsCubit(this.deliveryRepo) : super(GetDeliveryOptionsInitial());

  Future<void> getDeliveryOptions() async {
    emit(GetDeliveryOptionsLoading());
    final result = await deliveryRepo.getDeliveryOptions();
    result.fold(
          (failure) => emit(GetDeliveryOptionsFailure(errorMessage: failure.errorMessage)),
          (options) => emit(GetDeliveryOptionsSuccess(options: options)),
    );
  }
}