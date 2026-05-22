// get_orders_cubit.dart
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import '../../../data/entities/order_entity.dart';
import '../../../data/repos/order_repo.dart';

part 'get_orders_state.dart';

class GetOrdersCubit extends Cubit<GetOrdersState> {
  final OrderRepo orderRepo;
  GetOrdersCubit(this.orderRepo) : super(GetOrdersInitial());

  Future<void> getOrders() async {
    emit(GetOrdersLoading());
    final result = await orderRepo.getOrders();
    result.fold(
          (failure) => emit(GetOrdersFailure(errorMessage: failure.errorMessage)),
          (orders) => emit(GetOrdersSuccess(orders: orders)),
    );
  }
}