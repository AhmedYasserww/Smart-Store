// cancel_order_cubit.dart
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import '../../../data/repos/order_repo.dart';

part 'cancel_order_state.dart';

class CancelOrderCubit extends Cubit<CancelOrderState> {
  final OrderRepo orderRepo;
  CancelOrderCubit(this.orderRepo) : super(CancelOrderInitial());

  Future<void> cancelOrder({required String orderId}) async {
    emit(CancelOrderLoading());
    final result = await orderRepo.cancelOrder(orderId: orderId);
    result.fold(
          (failure) => emit(CancelOrderFailure(errorMessage: failure.errorMessage)),
          (message) => emit(CancelOrderSuccess(message: message)),
    );
  }
}