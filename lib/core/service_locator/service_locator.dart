import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:smart_store/features/categories/data/repos/categories_repo_imp.dart';
import 'package:smart_store/features/home/data/repos/home_repo.dart';
import 'package:smart_store/features/home/data/repos/home_repo_impl.dart';
import 'package:smart_store/features/home/presentation/manager/RecentlyHomeCubit/recently_home_cubit.dart';
import 'package:smart_store/features/home/presentation/manager/highlights_home_cubit/highlights_home_cubit.dart';
import 'package:smart_store/features/home/presentation/top_selling_cubit/top_selling_home_cubit.dart';
import 'package:smart_store/features/products/data/repos/product_repo_imp.dart';

import '../../features/auth/data/repos/auth_repo_imp.dart';
import '../../features/auth/presentation/manager/google_log_in_cubit/google_login_cubit.dart';
import '../../features/cart/data/repos/cart_repo_imp.dart';
import '../../features/cart/presentation/manager/add_to_cart_cubit/add_to_cart_cubit.dart';
import '../../features/cart/presentation/manager/get_cart_cubit/get_cart_cubit.dart';
import '../../features/delivery/data/repos/delivery_repo_imp.dart';
import '../../features/delivery/presentation/manager/add_address_cubit/add_address_cubit.dart';
import '../../features/delivery/presentation/manager/delete_address_cubit/delete_address_cubit.dart';
import '../../features/delivery/presentation/manager/get_address_cubit/get_addresses_cubit.dart';
import '../../features/delivery/presentation/manager/get_delivery_options_cubit/get_delivery_options_cubit.dart';
import '../../features/delivery/presentation/manager/update_address_cubit/update_address_cubit.dart';
import '../../features/more/profile/data/repos/profile_repo_imp.dart';
import '../../features/more/profile/presentation/manager/change_password_cubit/change_password_cubit.dart';
import '../../features/more/profile/presentation/manager/get_profile_cubit/get_profile_cubit.dart';
import '../../features/orders/data/repos/order_repo_imp.dart';
import '../../features/orders/presentation/manager/cancel_order_cubit/cancel_order_cubit.dart';
import '../../features/orders/presentation/manager/create_order_cubit/create_order_cubit.dart';
import '../../features/orders/presentation/manager/get_order_cubit/get_orders_cubit.dart';
import '../../features/orders/presentation/manager/get_order_details_cubit/get_order_details_cubit.dart';
import '../../features/payment/data/repos/payment_repo_imp.dart';
import '../../features/payment/presentation/manager/payment_cubit/payment_cubit.dart';
import '../../features/products/presentation/manager/get_recommendations_cubit/get_recommendations_cubit.dart';
import '../../features/search/data/repos/search_repo.dart';
import '../../features/search/data/repos/search_repo_imp.dart';
import '../../features/search/presentation/manager/search_for_product_cubit/search_for_product_cubit.dart';
import '../../features/vto/data/repos/vto_repo_imp.dart';
import '../../features/vto/presentation/manager/vto_cubit.dart';
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

  getIt.registerFactory<AddToCartCubit>(
    () => AddToCartCubit(getIt<CartRepoImpl>()),
  );
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
  getIt.registerSingleton<DeliveryRepoImpl>(
    DeliveryRepoImpl(apiService: getIt<ApiService>()),
  );

  getIt.registerFactory<AddAddressCubit>(
    () => AddAddressCubit(getIt<DeliveryRepoImpl>()),
  );

  getIt.registerFactory<GetAddressesCubit>(
    () => GetAddressesCubit(getIt<DeliveryRepoImpl>()),
  );
  getIt.registerFactory<UpdateAddressCubit>(
    () => UpdateAddressCubit(getIt<DeliveryRepoImpl>()),
  );
  getIt.registerSingleton<OrderRepoImpl>(
    OrderRepoImpl(apiService: getIt<ApiService>()),
  );

  getIt.registerFactory<CreateOrderCubit>(
    () => CreateOrderCubit(getIt<OrderRepoImpl>()),
  );
  getIt.registerFactory<GetDeliveryOptionsCubit>(
    () => GetDeliveryOptionsCubit(getIt<DeliveryRepoImpl>()),
  );
  getIt.registerFactory<DeleteAddressCubit>(
    () => DeleteAddressCubit(getIt<DeliveryRepoImpl>()),
  );
  getIt.registerSingleton<PaymentRepoImpl>(
    PaymentRepoImpl(apiService: getIt.get<ApiService>()),
  );

  getIt.registerFactory<PaymentCubit>(
    () => PaymentCubit(getIt.get<PaymentRepoImpl>()),
  );
  getIt.registerFactory<GoogleLoginCubit>(
        () => GoogleLoginCubit(getIt.get<AuthRepoImpl>()),
  );

  getIt.registerFactory<GetOrderDetailsCubit>(
    () => GetOrderDetailsCubit(getIt.get<OrderRepoImpl>()),
  );
  getIt.registerFactory<GetOrdersCubit>(
    () => GetOrdersCubit(getIt.get<OrderRepoImpl>()),
  );
  getIt.registerFactory<CancelOrderCubit>(
    () => CancelOrderCubit(getIt.get<OrderRepoImpl>()),
  );
  getIt.registerSingleton<VtoRepoImpl>(
    VtoRepoImpl(apiService: getIt.get<ApiService>()),
  );
  getIt.registerFactory<VtoCubit>(() => VtoCubit(getIt.get<VtoRepoImpl>()));
  getIt.registerFactory<GetRecommendationsCubit>(
    () => GetRecommendationsCubit(getIt<ProductsRepoImpl>()),
  );
  getIt.registerSingleton<HomeRepo>(
    HomeRepoImpl(apiService: getIt.get<ApiService>()),
  );
  getIt.registerFactory<RecentlyHomeCubit>(
    () => RecentlyHomeCubit(homeRepo: getIt<HomeRepo>()),
  );
  getIt.registerFactory<HighlightsHomeCubit>(
    () => HighlightsHomeCubit(homeRepo: getIt<HomeRepo>()),
  );
  getIt.registerFactory<TopSellingHomeCubit>(
    () => TopSellingHomeCubit(homeRepo: getIt<HomeRepo>()),
  );
}
