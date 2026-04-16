import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../data/repos/cart_repo.dart';
import '../get_cart_cubit/get_cart_cubit.dart';

part 'update_cart_item_state.dart';

class UpdateCartItemCubit extends Cubit<UpdateCartItemState> {
  final CartRepo cartRepo;
  final GetCartCubit getCartCubit;

  UpdateCartItemCubit({
    required this.cartRepo,
    required this.getCartCubit,
  }) : super(UpdateCartItemInitial());

  Future<void> updateQuantity({
    required String cartItemId,
    required int quantity,
  }) async {
    emit(UpdateCartItemLoading(cartItemId: cartItemId));

    final result = await cartRepo.updateCartItemQuantity(
      cartItemId: cartItemId,
      quantity: quantity,
    );

    result.fold(
          (failure) =>
          emit(UpdateCartItemFailure(errorMessage: failure.errorMessage)),
          (updatedCart) {
        emit(UpdateCartItemSuccess());
        getCartCubit.emit(GetCartSuccess(cart: updatedCart));
      },
    );
  }
}