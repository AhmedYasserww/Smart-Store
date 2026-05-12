// features/order/presentation/manager/create_order_cubit/create_order_cubit.dart

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import '../../../data/entities/create_order_entity.dart';
import '../../../data/repos/order_repo.dart';

part 'create_order_state.dart';

class CreateOrderCubit extends Cubit<CreateOrderState> {
  final OrderRepo orderRepo;

  CreateOrderCubit(this.orderRepo) : super(CreateOrderInitial());

  Future<void> createOrder({
    required String deliveryAddressId,
    required String deliveryOptionId,
  }) async {
    emit(CreateOrderLoading());
    final result = await orderRepo.createOrder(
      deliveryAddressId: deliveryAddressId,
      deliveryOptionId: deliveryOptionId,
    );
    result.fold(
          (failure) => emit(CreateOrderFailure(errorMessage: failure.errorMessage)),
          (order) => emit(CreateOrderSuccess(order: order)),
    );
  }}