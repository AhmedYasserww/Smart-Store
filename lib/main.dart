import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_store/features/auth/presentation/views/forget_password_view.dart';
import 'package:smart_store/features/auth/presentation/views/log_in_view.dart';
import 'package:smart_store/features/auth/presentation/views/verification_view.dart';
import 'package:smart_store/features/home/presentation/views/home_view.dart';
import 'package:smart_store/features/onboarding/presentation/views/onboarding_view.dart';

import 'core/helper_functions/on_generate_routes.dart';
import 'core/helper_functions/save_user_data.dart';
import 'core/service_locator/service_locator.dart';
import 'features/auth/data/repos/auth_repo_imp.dart';
import 'features/auth/presentation/manager/verification_otp_cubit/verify_otp_cubit.dart';
import 'features/auth/presentation/views/reset_password_view.dart';
import 'features/bottom_nav_bar/presentation/views/bottom_nav_bar_view.dart';
import 'features/delivery/presentation/views/review_and_confirm_delivery_view.dart';
import 'features/products/presentation/views/product_details_view.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
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
    return MaterialApp(
        debugShowCheckedModeBanner: false,
      // useInheritedMediaQuery: true,
      // locale: DevicePreview.locale(context),
      builder: DevicePreview.appBuilder,
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
        fontFamily: 'Inter',

      ),

      onGenerateRoute: onGenerateRoutes,
      //initialRoute: ResetPasswordView.routeName,
     // initialRoute: OnBoardingView.routeName,
       //initialRoute: LogInView.routeName,
     initialRoute: CustomNavigationBar.routeName,

    );
  }
}
