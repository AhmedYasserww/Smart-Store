import 'dart:ui';

import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'core/helper_functions/on_generate_routes.dart';
import 'core/service_locator/service_locator.dart';
import 'features/bottom_nav_bar/presentation/views/bottom_nav_bar_view.dart';
import 'features/onboarding/presentation/views/onboarding_view.dart';

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
     // builder: DevicePreview.appBuilder,
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
        fontFamily: 'Inter',
      ),
      scrollBehavior: CustomScrollBehavior(),
    onGenerateRoute: onGenerateRoutes,
      //initialRoute: ResetPasswordView.routeName,
      // initialRoute: OnBoardingView.routeName,
      //initialRoute: LogInView.routeName,
      initialRoute: CustomNavigationBar.routeName,
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
