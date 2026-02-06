import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'product_or_list_state.dart';

class ProductOrListCubit extends Cubit<ProductOrListState> {
  ProductOrListCubit() : super(ProductOrListInitial());
  void changeUi(bool change) {
    change ? emit(ProductOrListProduct()) : emit(ProductOrList());
  }
}
