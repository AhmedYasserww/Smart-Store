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
import 'features/onboarding/presentation/views/onboarding_view.dart';
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
    create: (_) => GetCartCubit(getIt.get<CartRepoImpl>())..getCart(),)

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
      //  initialRoute: OnBoardingView.routeName,
       // initialRoute: LogInView.routeName,
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




class PaymentPage extends StatefulWidget {
  const PaymentPage({super.key});

  @override
  State<PaymentPage> createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {
  bool isLoading = false;
  String message = '';

  Future<void> makePayment() async {
    try {
      setState(() {
        isLoading = true;
        message = '';
      });

      const orderId = "8ebf73a4-b7b1-4abd-9d80-670a9dee15fd";

      final response = await http.post(
        Uri.parse(
          "https://tryha.runasp.net/api/Payment/create-payment-intent/$orderId",
        ),
        headers: {
          "Content-Type": "application/json",
          "Authorization":
          "Bearer YOUR_TOKEN_HERE"
        },
      );

      final responseData = jsonDecode(response.body);

      print(responseData);

      final clientSecret = responseData["data"]["clientSecret"];

      // Initialize Payment Sheet
      await Stripe.instance.initPaymentSheet(
        paymentSheetParameters: SetupPaymentSheetParameters(
          paymentIntentClientSecret: clientSecret,
          merchantDisplayName: 'TryHa Store',
        ),
      );

      // Present Payment Sheet
      await Stripe.instance.presentPaymentSheet();

      setState(() {
        message = "Payment completed successfully";
      });
    } on StripeException catch (e) {
      setState(() {
        message = e.error.localizedMessage ?? "Payment cancelled";
      });
    } catch (e) {
      setState(() {
        message = e.toString();
      });
    } finally {
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xfff4f6f9),
      appBar: AppBar(
        title: const Text("Secure Payment"),
        centerTitle: true,
      ),
      body: Center(
        child: Container(
          width: 380,
          padding: const EdgeInsets.all(24),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(14),
            boxShadow: [
              BoxShadow(
                blurRadius: 10,
                color: Colors.black.withOpacity(0.08),
              )
            ],
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Icon(
                Icons.lock_outline,
                size: 70,
                color: Colors.indigo,
              ),

              const SizedBox(height: 20),

              const Text(
                "Secure Payment",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 30),

              SizedBox(
                width: double.infinity,
                height: 55,
                child: ElevatedButton(
                  onPressed: isLoading ? null : makePayment,
                  child: isLoading
                      ? const CircularProgressIndicator(
                    color: Colors.white,
                  )
                      : const Text(
                    "Confirm Payment",
                    style: TextStyle(fontSize: 16),
                  ),
                ),
              ),

              const SizedBox(height: 20),

              Text(
                message,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: message.contains("success")
                      ? Colors.green
                      : Colors.red,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}