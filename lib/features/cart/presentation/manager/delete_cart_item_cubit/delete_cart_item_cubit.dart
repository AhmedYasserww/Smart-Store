import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../data/repos/cart_repo.dart';
import '../get_cart_cubit/get_cart_cubit.dart';

part 'delete_cart_item_state.dart';

class DeleteCartItemCubit extends Cubit<DeleteCartItemState> {
  final CartRepo cartRepo;
  final GetCartCubit getCartCubit;

  DeleteCartItemCubit({
    required this.cartRepo,
    required this.getCartCubit,
  }) : super(DeleteCartItemInitial());

  Future<void> deleteCartItem({required String itemId}) async {
    emit(DeleteCartItemLoading());

    final result = await cartRepo.deleteFromCart(productId: itemId);

    result.fold(
          (failure) => emit(DeleteCartItemFailure(errorMessage: failure.errorMessage)),
          (_) async {
        emit(DeleteCartItemSuccess());
        await getCartCubit.getCart();
      },
    );
  }
}
