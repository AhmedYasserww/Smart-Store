import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import '../../../data/entities/add_to_cart_item_entity.dart';
import '../../../data/repos/cart_repo.dart';
part 'add_to_cart_state.dart';

class AddToCartCubit extends Cubit<AddToCartState> {
  final CartRepo cartRepo;

  AddToCartCubit(this.cartRepo) : super(AddToCartInitial());

  Future<void> addToCart({required AddToCartItemEntity cartItem}) async {
    emit(AddToCartLoading());

    final result = await cartRepo.addToCart(cartItemEntity: cartItem);

    result.fold(
          (failure) => emit(AddToCartFailure(errorMessage: failure.errorMessage)),
          (message) => emit(AddToCartSuccess(message: message)),
    );
  }
}