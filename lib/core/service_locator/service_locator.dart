import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:smart_store/features/categories/data/repos/categories_repo_imp.dart';
import 'package:smart_store/features/products/data/repos/product_repo_imp.dart';

import '../../features/auth/data/repos/auth_repo_imp.dart';
import '../../features/search/data/repos/search_repo.dart';
import '../../features/search/data/repos/search_repo_imp.dart';
import '../../features/search/presentation/manager/search_for_product_cubit/search_for_product_cubit.dart';
import '../services/api_service.dart';

final getIt = GetIt.instance;

void setupServiceLocator() {
  getIt.registerSingleton<ApiService>(ApiService(dio: Dio()));
  getIt.registerSingleton<AuthRepoImpl>(
    AuthRepoImpl(apiService: getIt.get<ApiService>()),
  );
  getIt.registerSingleton<ProductsRepoImpl>(
    ProductsRepoImpl(apiService: getIt.get<ApiService>()),
  );
  getIt.registerSingleton<CategoriesRepoImpl>(
    CategoriesRepoImpl(apiService: getIt.get<ApiService>()),
  );

  getIt.registerLazySingleton<SearchRepo>(
        () => SearchRepoImp(apiService: getIt<ApiService>()),
  );

  getIt.registerFactory<SearchForProductCubit>(
        () => SearchForProductCubit(getIt<SearchRepo>()),
  );
  // getIt.registerSingleton<GetAllProductRepoImp>(GetAllProductRepoImp(apiService:getIt.get<ApiService>(),));
  // getIt.registerSingleton<GetAllCategoryRepoImp>(GetAllCategoryRepoImp(apiService:getIt.get<ApiService>(),));
  // getIt.registerSingleton<GetAllBrandsRepoImp>(GetAllBrandsRepoImp(apiService:getIt.get<ApiService>(),));
  // getIt.registerSingleton<SearchRepoImp>(
  //   SearchRepoImp(apiService: getIt.get<ApiService>()),
  // );
  // getIt.registerFactory<SearchForProductCubit>(() => SearchForProductCubit(
  //     getIt<SearchRepoImp>(),
  //     ));
  // getIt.registerSingleton<GetAllProductBySingleProductRepoImp>(
  //   GetAllProductBySingleProductRepoImp(apiService: getIt.get<ApiService>()),
  // );
  // getIt.registerSingleton<GetFilteredProductsRepoImp>(
  //   GetFilteredProductsRepoImp(apiService: getIt.get<ApiService>()),
  // );
  //
  // getIt.registerSingleton<CartRepoImp>(
  //   CartRepoImp(apiService: getIt.get<ApiService>()),
  // );
  // getIt.registerFactory<GetCartCubit>(() => GetCartCubit(
  //   getIt<CartRepoImp>(),
  // ));
}
