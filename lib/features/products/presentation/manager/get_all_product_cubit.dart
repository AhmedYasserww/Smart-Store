import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../data/models/product_model.dart';
import '../../data/models/product_query_params_model.dart';
import '../../data/repos/product_repo.dart';

part 'get_all_product_state.dart';

class GetAllProductCubit extends Cubit<GetAllProductState> {
  final ProductsRepo productsRepo;
  ProductQueryParams _currentParams = const ProductQueryParams();
  List<ProductModel> _cachedProducts = const [];

  GetAllProductCubit(this.productsRepo) : super(GetAllProductInitial());

  ProductQueryParams get currentParams => _currentParams;
  List<ProductModel> get cachedProducts => _cachedProducts;

  Future<void> fetchAllProducts({ProductQueryParams? params}) async {
    if (params != null) {
      _currentParams = params;
    }

    emit(GetAllProductLoading());

    final result = await productsRepo.getAllProducts(params: _currentParams);

    result.fold(
      (failure) =>
          emit(GetAllProductFailure(errorMessage: failure.errorMessage)),
      (productsResponse) {
        _cachedProducts = productsResponse.items;
        emit(GetAllProductSuccess(products: productsResponse.items));
      },
    );
  }

  Future<void> resetFilters() async {
    _currentParams = const ProductQueryParams();
    await fetchAllProducts(params: _currentParams);
  }
}
