import 'package:flutter/material.dart';
import 'package:smart_store/features/orders/presentation/views/order_details_view.dart';
import 'package:smart_store/features/orders/presentation/views/order_status_view.dart';
import 'package:smart_store/features/orders/presentation/views/orders_view.dart';
import 'package:smart_store/features/profile/presentation/views/change_password_view.dart';

import '../../features/auth/presentation/views/forget_password_view.dart';
import '../../features/auth/presentation/views/log_in_view.dart';
import '../../features/auth/presentation/views/register_view.dart';
import '../../features/auth/presentation/views/reset_password_view.dart';
import '../../features/auth/presentation/views/verification_view.dart';
import '../../features/bottom_nav_bar/presentation/views/bottom_nav_bar_view.dart';
import '../../features/cart/presentation/views/cart_view.dart';
import '../../features/delivery/data/entities/delivery_address_entity.dart';
import '../../features/delivery/presentation/views/confirm_order_view.dart';
import '../../features/delivery/presentation/views/delivery_option_view.dart';
import '../../features/delivery/presentation/views/delivery_address_view.dart';
import '../../features/delivery/presentation/views/edit_delivery_address_view.dart';
import '../../features/delivery/presentation/views/payment_method_view.dart';
import '../../features/delivery/presentation/views/review_and_confirm_delivery_view.dart';
import '../../features/home/presentation/views/home_view.dart';
import '../../features/onboarding/presentation/views/onboarding_view.dart';
import '../../features/products/data/models/product_model.dart';
import '../../features/products/presentation/views/find_size_view.dart';
import '../../features/products/presentation/views/product_details_view.dart';
import '../../features/products/presentation/views/product_view.dart';
import '../../features/profile/presentation/views/edit_profile_view.dart';
import '../../features/profile/presentation/views/profile_view.dart';
import '../../features/search/presentation/views/search_view.dart';
import '../../features/vto/presentation/views/vto_view.dart';
import '../../features/wishlist/presentation/views/wishlist_view.dart';

Route<dynamic> onGenerateRoutes(RouteSettings settings) {
  switch (settings.name) {
    // case SplashView.routeName:
    //   return MaterialPageRoute(builder: (context) => const SplashView());

    case OnBoardingView.routeName:
      return MaterialPageRoute(builder: (context) => const OnBoardingView());
    case LogInView.routeName:
      return MaterialPageRoute(builder: (context) => const LogInView());
    case RegisterView.routeName:
      return MaterialPageRoute(builder: (context) => const RegisterView());
    case ForgetPasswordView.routeName:
      return MaterialPageRoute(
        builder: (context) => const ForgetPasswordView(),
      );
    case VerificationView.routeName:
      final args = settings.arguments as Map;
      return MaterialPageRoute(
        builder: (_) =>
            VerificationView(userId: args["userId"], type: args["type"]),
      );
    case ResetPasswordView.routeName:
      return MaterialPageRoute(builder: (context) => const ResetPasswordView());
    case CustomNavigationBar.routeName:
      return MaterialPageRoute(
        builder: (context) => const CustomNavigationBar(),
      );
    case HomeView.routeName:
      return MaterialPageRoute(builder: (context) => const HomeView());
    case SearchView.routeName:
      return MaterialPageRoute(builder: (context) => const SearchView());
    case ProductDetailsView.routeName:
      final arg = settings.arguments;
      if (arg is String && arg.isNotEmpty) {
        return MaterialPageRoute(
          builder: (context) => ProductDetailsView(productId: arg),
        );
      }
      if (arg is ProductModel && arg.id.isNotEmpty) {
        return MaterialPageRoute(
          builder: (context) => ProductDetailsView(productId: arg.id),
        );
      }
      return MaterialPageRoute(
        builder: (context) => const Scaffold(
          body: Center(child: Text('Product details argument is missing.')),
        ),
      );
    case FindSizeView.routeName:
      return MaterialPageRoute(builder: (context) => const FindSizeView());
    case ProductView.routeName:
      return MaterialPageRoute(builder: (context) => const ProductView());
    case VtoView.routeName:
      return MaterialPageRoute(builder: (context) => const VtoView());
    case CartView.routeName:
      return MaterialPageRoute(builder: (context) => const CartView());
    case DeliveryAddressView.routeName:
      return MaterialPageRoute(
        builder: (context) => const DeliveryAddressView(),
      );
    case EditDeliveryAddressView.routeName:
      final address = settings.arguments as DeliveryAddressEntity;
      return MaterialPageRoute(
        builder: (context) => EditDeliveryAddressView(address: address),
      );
    case DeliveryOptionView.routeName:
      final addressId = settings.arguments as String;
      return MaterialPageRoute(
        builder: (context) => DeliveryOptionView(addressId: addressId),
      );
    case PaymentMethodView.routeName:
      return MaterialPageRoute(builder: (context) => const PaymentMethodView());
    case ReviewAndConfirmDeliveryView.routeName:
      return MaterialPageRoute(
        builder: (context) => const ReviewAndConfirmDeliveryView(),
      );
    case ConfirmOrderView.routeName:
      return MaterialPageRoute(builder: (context) => const ConfirmOrderView());
    case ProfileView.routeName:
      return MaterialPageRoute(builder: (context) => const ProfileView());
    case EditProfileView.routeName:
      return MaterialPageRoute(builder: (context) => const EditProfileView());
    case ChangePasswordView.routeName:
      return MaterialPageRoute(
        builder: (context) => const ChangePasswordView(),
      );
    case OrdersView.routeName:
      return MaterialPageRoute(builder: (context) => const OrdersView());
    case OrderDetailsView.routeName:
      return MaterialPageRoute(builder: (context) => const OrderDetailsView());
    case OrderStatusView.routeName:
      return MaterialPageRoute(builder: (context) => const OrderStatusView());
    case WishlistView.routeName:
      return MaterialPageRoute(builder: (context) => const WishlistView());
    default:
      return MaterialPageRoute(builder: (context) => const Scaffold());
  }
}
