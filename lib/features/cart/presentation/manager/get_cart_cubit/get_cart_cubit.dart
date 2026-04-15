// get_cart_cubit.dart
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import '../../../data/entities/get_cart_entity.dart';
import '../../../data/repos/cart_repo.dart';

part 'get_cart_state.dart';

class GetCartCubit extends Cubit<GetCartState> {
  final CartRepo cartRepo;

  GetCartCubit(this.cartRepo) : super(GetCartInitial());

  Future<void> getCart() async {
    emit(GetCartLoading());

    final result = await cartRepo.getCart();

    result.fold(
          (failure) => emit(GetCartFailure(errorMessage: failure.errorMessage)),
          (cart) => emit(GetCartSuccess(cart: cart)),
    );
  }
}