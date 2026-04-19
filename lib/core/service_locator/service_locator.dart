import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:smart_store/features/categories/data/repos/categories_repo_imp.dart';
import 'package:smart_store/features/products/data/repos/product_repo_imp.dart';

import '../../features/auth/data/repos/auth_repo_imp.dart';
import '../../features/cart/data/repos/cart_repo_imp.dart';
import '../../features/cart/presentation/manager/add_to_cart_cubit/add_to_cart_cubit.dart';
import '../../features/cart/presentation/manager/get_cart_cubit/get_cart_cubit.dart';
import '../../features/profile/data/repos/profile_repo_imp.dart';
import '../../features/profile/presentation/manager/change_password_cubit/change_password_cubit.dart';
import '../../features/profile/presentation/manager/get_profile_cubit/get_profile_cubit.dart';
import '../../features/search/data/repos/search_repo.dart';
import '../../features/search/data/repos/search_repo_imp.dart';
import '../../features/search/presentation/manager/search_for_product_cubit/search_for_product_cubit.dart';
import '../../features/wishlist/data/repos/wishlist_repo_imp.dart';
import '../../features/wishlist/presentation/manager/get_wishlist_cubit/get_wishlist_cubit.dart';
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
  getIt.registerSingleton<CartRepoImpl>(
    CartRepoImpl(apiService: getIt.get<ApiService>()),
  );

  getIt.registerFactory<AddToCartCubit>(() => AddToCartCubit(
    getIt<CartRepoImpl>(),
  ));
  getIt.registerFactory(() => GetCartCubit(getIt.get<CartRepoImpl>()));


  getIt.registerLazySingleton<WishlistRepoImpl>(
        () => WishlistRepoImpl(apiService: getIt<ApiService>()),
  );

  getIt.registerLazySingleton<GetWishlistCubit>(
        () => GetWishlistCubit(getIt<WishlistRepoImpl>()),
  );

  getIt.registerSingleton<ProfileRepoImpl>(
    ProfileRepoImpl(apiService: getIt<ApiService>()),
  );

  getIt.registerFactory<GetProfileCubit>(
        () => GetProfileCubit(getIt<ProfileRepoImpl>()),
  );
  getIt.registerFactory<ChangePasswordCubit>(
        () => ChangePasswordCubit(getIt<ProfileRepoImpl>()),
  );

}
