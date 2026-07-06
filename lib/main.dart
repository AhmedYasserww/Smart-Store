import 'dart:convert';
import 'dart:ui';

import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:http/http.dart' as http;
import 'package:smart_store/core/widgets/custom_loading_indicator.dart';

import 'core/helper_functions/on_generate_routes.dart';
import 'core/service_locator/service_locator.dart';
import 'features/auth/presentation/views/log_in_view.dart';
import 'features/bottom_nav_bar/presentation/views/bottom_nav_bar_view.dart';
import 'features/cart/data/repos/cart_repo_imp.dart';
import 'features/cart/presentation/manager/get_cart_cubit/get_cart_cubit.dart';
import 'features/delivery/presentation/views/confirm_order_view.dart';
import 'features/delivery/presentation/views/edit_delivery_address_view.dart';
import 'features/delivery/presentation/views/widgets/edit_delivery_address_view_widgets/edit_delivery_address_view_body.dart';
import 'features/home/presentation/views/widgets/custom_vto_animation.dart';
import 'features/onboarding/presentation/views/onboarding_view.dart';
import 'features/vto/data/repos/vto_repo_imp.dart';
import 'features/vto/presentation/manager/vto_cubit.dart';
import 'features/wishlist/data/repos/wishlist_repo_imp.dart';
import 'features/wishlist/presentation/manager/get_wishlist_cubit/get_wishlist_cubit.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Stripe.publishableKey = 'pk_test_51S7Nn9C0d04QyKOsnNcP2OGobEYBC089K4wgAdwQsj6YLJNf6nvwetXLFhi5xXTkwZwScanNRp5eLuvrUcbtOu7000lp6Vkubg';
  await Stripe.instance.applySettings();
  setupServiceLocator();
  // final userData = await UserPreferences.getUserData();
  // print(userData['id']);
  runApp(
    // DevicePreview(
    //   enabled: !kReleaseMode,
    //   builder: (context) => MyApp(), // Wrap your app
    // ),
     MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
        BlocProvider(
        create: (_)=>GetWishlistCubit(getIt.get<WishlistRepoImpl>())..getWishlist(),),

    BlocProvider(
    create: (_) => GetCartCubit(getIt.get<CartRepoImpl>())..getCart(),),
          BlocProvider(
            create: (_) => VtoCubit(getIt<VtoRepoImpl>()),
          )

        ],



      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        // useInheritedMediaQuery: true,
        // locale: DevicePreview.locale(context),
       // builder: DevicePreview.appBuilder,
        theme: ThemeData(
          scaffoldBackgroundColor: Colors.white,
          fontFamily: 'Inter',
        ),
        scrollBehavior: CustomScrollBehavior(),
      onGenerateRoute: onGenerateRoutes,
       //initialRoute: ConfirmOrderView.routeName,
       // initialRoute: OnBoardingView.routeName,
        //initialRoute: LogInView.routeName,
       initialRoute: CustomNavigationBar.routeName,
    //     home: Scaffold(
    //       body: CustomLoadingIndicator(),
    //     ),
      ),
    );
  }
}
class CustomScrollBehavior extends MaterialScrollBehavior {
  @override
  Set<PointerDeviceKind> get dragDevices => {
    PointerDeviceKind.touch,
    PointerDeviceKind.mouse,
    PointerDeviceKind.stylus,
    PointerDeviceKind.unknown,
  };
}


// main.dart



