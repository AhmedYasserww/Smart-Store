import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../../core/helper_functions/format_size_.dart';
import '../../data/models/product_model.dart';
import '../../data/models/product_query_params_model.dart';
import '../../data/repos/product_repo.dart';

part 'get_all_product_state.dart';

class GetAllProductCubit extends Cubit<GetAllProductState> {
  final ProductsRepo productsRepo;

  ProductQueryParams _currentParams = const ProductQueryParams();

  List<ProductModel> _cachedProducts = [];
  List<ProductModel> _allProducts = []; // كل المنتجات محفوظة للكاش

  GetAllProductCubit(this.productsRepo) : super(GetAllProductInitial());

  ProductQueryParams get currentParams => _currentParams;
  List<ProductModel> get cachedProducts => _cachedProducts;
  List<ProductModel> get allProducts => _allProducts;

  // ================= Fetch =================
  Future<void> fetchAllProducts({ProductQueryParams? params}) async {
    if (params != null) _currentParams = params;

    emit(GetAllProductLoading());

    final result = await productsRepo.getAllProducts(params: _currentParams);

    result.fold(
          (failure) =>
          emit(GetAllProductFailure(errorMessage: failure.errorMessage)),
          (productsResponse) {
        _cachedProducts = productsResponse.items;

        if (_allProducts.isEmpty) {
          _allProducts = productsResponse.items;
        }

        emit(GetAllProductSuccess(products: _cachedProducts));
      },
    );
  }

  Future<void> resetFilters() async {
    _currentParams = const ProductQueryParams();
    await fetchAllProducts(params: _currentParams);
  }

  // ================= Helpers =================

  /// ترجع كل السايزات من كل المنتجات (موحدة) مع أول حرف فقط ومرتبة
  List<SizeFilterOption> getAllSizes() {
    final map = <String, String>{};
    for (final product in _allProducts) {
      for (final size in product.productSizes) {
        if (size.sizeId.isNotEmpty && size.sizeName.isNotEmpty) {
          map[size.sizeId] = size.sizeName;
        }
      }
    }

    // ترتيب حسب الأحجام
    final order = ['S', 'M', 'L', 'XL', '2XL', '3XL', '4XL', '5XL'];

    List<SizeFilterOption> list = map.entries
        .map((e) => SizeFilterOption(
      id: e.key,
      name: formatSize(e.value),
    ))
        .toList();

    list.sort((a, b) {
      final indexA = order.indexOf(a.name);
      final indexB = order.indexOf(b.name);
      if (indexA == -1 && indexB == -1) return a.name.compareTo(b.name);
      if (indexA == -1) return 1;
      if (indexB == -1) return -1;
      return indexA.compareTo(indexB);
    });

    return list;
  }

  /// ترجع كل الألوان من كل المنتجات بدون تكرار
  List<String> getAllColors() {
    final set = <String>{};
    for (final product in _allProducts) {
      for (final color in product.colors) {
        if (color.isNotEmpty) set.add(color);
      }
    }
    return set.toList();
  }



}

// ================= Model SizeFilterOption =================
class SizeFilterOption {
  const SizeFilterOption({required this.id, required this.name});
  final String id;
  final String name;
}