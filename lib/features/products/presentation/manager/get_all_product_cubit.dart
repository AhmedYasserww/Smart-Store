import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import '../../data/models/product_model.dart';
import '../../data/repos/product_repo.dart';
part 'get_all_product_state.dart';

class GetAllProductCubit extends Cubit<GetAllProductState> {
  final ProductsRepo productsRepo;

  GetAllProductCubit(this.productsRepo) : super(GetAllProductInitial());

  Future<void> fetchAllProducts() async {
    emit(GetAllProductLoading());

    final result = await productsRepo.getAllProducts();

    result.fold(
          (failure) => emit(GetAllProductFailure(errorMessage: failure.errorMessage)),
          (productsResponse) => emit(GetAllProductSuccess(products: productsResponse.items)),
    );
  }
}