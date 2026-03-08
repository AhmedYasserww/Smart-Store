import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

import '../../features/auth/data/repos/auth_repo_imp.dart';
import '../services/api_service.dart';

final getIt = GetIt.instance;

void setupServiceLocator() {
  getIt.registerSingleton<ApiService>(ApiService(dio: Dio()));
  getIt.registerSingleton<AuthRepoImpl>(AuthRepoImpl(apiService:getIt.get<ApiService>(),));
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

