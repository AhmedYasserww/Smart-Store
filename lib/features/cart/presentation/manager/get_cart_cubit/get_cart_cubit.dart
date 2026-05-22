// get_cart_cubit.dart
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import '../../../data/entities/get_cart_entity.dart';
import '../../../data/models/cart_model.dart';
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

  void updateItemQuantityLocally({
    required String itemId,
    required int newQuantity,
  }) {
    final currentState = state;
    if (currentState is! GetCartSuccess) return;

    final updatedItems = currentState.cart.items.map((item) {
      if (item.id == itemId) {
        final clamped = newQuantity.clamp(1, item.stockQuantity);
        return CartItemDetailsModel(
          id: item.id,
          productId: item.productId,
          quantity: clamped,
          stockQuantity: item.stockQuantity,
          color: item.color,
          size: item.size,
          productName: item.productName,
          productImageUrl: item.productImageUrl,
          createdAt: item.createdAt,
          unitPrice: item.unitPrice,
        );
      }
      return item;
    }).toList();

    final updatedCart = CartModel(
      cartId: currentState.cart.cartId,
      totalItems: currentState.cart.totalItems,
      totalPrice: updatedItems.fold(
        0,
            (sum, item) => sum + item.unitPrice * item.quantity,
      ),
      items: updatedItems,
      createdAt: currentState.cart.createdAt,
      updatedAt: currentState.cart.updatedAt,
    );

    emit(GetCartSuccess(cart: updatedCart));
  }

  Future<void> clearCart() async {
    final result = await cartRepo.clearCart();
    result.fold(
          (failure) => log('❌ ClearCart Failed: ${failure.errorMessage}'),
          (message) {
        log('✅ $message');
        emit(GetCartSuccess(
          cart: CartModel(
            cartId: '',
            totalItems: 0,
            totalPrice: 0,
            items: [],
            createdAt: '',
            updatedAt: '',
          ),
        ));
      },
    );
  }

}