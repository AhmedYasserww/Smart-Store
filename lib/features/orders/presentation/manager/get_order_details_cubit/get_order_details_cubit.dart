// get_order_details_cubit.dart
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import '../../../data/entities/order_details_entity.dart';
import '../../../data/repos/order_repo.dart';

part 'get_order_details_state.dart';

class GetOrderDetailsCubit extends Cubit<GetOrderDetailsState> {
  final OrderRepo orderRepo;

  GetOrderDetailsCubit(this.orderRepo) : super(GetOrderDetailsInitial());

  Future<void> getOrderDetails({required String orderId}) async {
    emit(GetOrderDetailsLoading());
    final result = await orderRepo.getOrderDetails(orderId: orderId);
    result.fold(
          (failure) => emit(GetOrderDetailsFailure(errorMessage: failure.errorMessage)),
          (order) => emit(GetOrderDetailsSuccess(order: order)),
    );
  }
}