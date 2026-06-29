import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_store/features/more/saved_address/presentation/views/saved_address_view.dart';
import 'package:smart_store/features/orders/presentation/views/order_details_view.dart';
import 'package:smart_store/features/orders/presentation/views/order_status_view.dart';
import 'package:smart_store/features/orders/presentation/views/orders_view.dart';
import '../../features/auth/presentation/views/forget_password_view.dart';
import '../../features/auth/presentation/views/log_in_view.dart';
import '../../features/auth/presentation/views/register_view.dart';
import '../../features/auth/presentation/views/reset_password_view.dart';
import '../../features/auth/presentation/views/verification_view.dart';
import '../../features/bottom_nav_bar/presentation/views/bottom_nav_bar_view.dart';
import '../../features/cart/presentation/views/cart_view.dart';
import '../../features/delivery/data/entities/delivery_address_entity.dart';
import '../../features/delivery/data/entities/delivery_option_entity.dart';
import '../../features/delivery/data/models/order_summary_argument.dart';
import '../../features/delivery/presentation/views/confirm_order_view.dart';
import '../../features/delivery/presentation/views/delivery_option_view.dart';
import '../../features/delivery/presentation/views/delivery_address_view.dart';
import '../../features/delivery/presentation/views/edit_delivery_address_view.dart';
import '../../features/delivery/presentation/views/payment_method_view.dart';
import '../../features/delivery/presentation/views/review_and_confirm_delivery_view.dart';
import '../../features/delivery/presentation/views/widgets/confirm_order_widgets/confirm_order_route.dart';
import '../../features/home/presentation/views/home_view.dart';
import '../../features/more/profile/presentation/views/change_password_view.dart';
import '../../features/more/profile/presentation/views/edit_profile_view.dart';
import '../../features/more/profile/presentation/views/profile_view.dart';
import '../../features/onboarding/presentation/views/onboarding_view.dart';
import '../../features/products/data/models/product_model.dart';
import '../../features/products/presentation/views/find_size_view.dart';
import '../../features/products/presentation/views/product_details_view.dart';
import '../../features/products/presentation/views/product_view.dart';
import '../../features/search/presentation/views/search_view.dart';
import '../../features/vto/data/models/vto_argument.dart';
import '../../features/vto/presentation/manager/vto_cubit.dart';
import '../../features/vto/presentation/views/generating_view.dart';
import '../../features/vto/presentation/views/preview_photo_view.dart';
import '../../features/vto/presentation/views/upload_photo_view.dart';
import '../../features/vto/presentation/views/vto_result_view.dart';
import '../../features/wishlist/presentation/views/wishlist_view.dart';
import 'dart:typed_data';


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
      final categoryId = settings.arguments as String?;
      return MaterialPageRoute(
        builder: (_) => ProductView(initialCategoryId: categoryId),
      );
    case CartView.routeName:
      return MaterialPageRoute(builder: (context) => const CartView());
    case DeliveryAddressView.routeName:
      return MaterialPageRoute(
        builder: (context) => const DeliveryAddressView(),
      );
    case EditDeliveryAddressView.routeName:
      final args = settings.arguments as Map<String, dynamic>;
      final address = args['address'] as DeliveryAddressEntity;
      final fromProfile = args['fromProfile'] as bool? ?? false;
      return MaterialPageRoute(
        builder: (_) => EditDeliveryAddressView(
          address: address,
          fromProfile: fromProfile,
        ),
      );
    case DeliveryOptionView.routeName:
      final address = settings.arguments as DeliveryAddressEntity;
      return MaterialPageRoute(
        builder: (_) => DeliveryOptionView(address: address),
      );

    case PaymentMethodView.routeName:
      final args = settings.arguments as Map<String, dynamic>;
      return MaterialPageRoute(
        builder: (_) => PaymentMethodView(
          address: args['address'] as DeliveryAddressEntity,
          deliveryOption: args['deliveryOption'] as DeliveryOptionEntity,
        ),
      );

    case ReviewAndConfirmDeliveryView.routeName:
      final args = settings.arguments as OrderSummaryArguments;
      return MaterialPageRoute(
        builder: (_) => ReviewAndConfirmDeliveryView(args: args),
      );
    case ConfirmOrderView.routeName:
      final orderId = settings.arguments as String;
      return ConfirmOrderRoute.route(orderId: orderId);
    // case ConfirmOrderView.routeName:
    //   return MaterialPageRoute(builder: (context) => const ConfirmOrderView());
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
      final orderId = settings.arguments as String;
      return MaterialPageRoute(
        builder: (_) => OrderDetailsView(orderId: orderId),
      );
    case OrderStatusView.routeName:
      final status = settings.arguments as String;
      return MaterialPageRoute(
        builder: (_) => OrderStatusView(status: status),
      );
    case WishlistView.routeName:
      return MaterialPageRoute(builder: (context) => const WishlistView());
      case SavedAddressView.routeName:
      return MaterialPageRoute(builder: (context) => const SavedAddressView());
    case UploadPhotoView.routeName:
      final args = settings.arguments as VtoArguments;
      return MaterialPageRoute(
        builder: (_) => UploadPhotoView(args: args),
      );

    case PreviewPhotoView.routeName:
      final map = settings.arguments as Map<String, dynamic>;
      return MaterialPageRoute(
        builder: (_) => PreviewPhotoView(
          image: map['image'] as File,
          args: map['args'] as VtoArguments,
        ),
      );

    case GeneratingView.routeName:
      final map = settings.arguments as Map<String, dynamic>;
      return MaterialPageRoute(
        builder: (context) => BlocProvider.value(
          value: context.read<VtoCubit>(), // ✅ نفس الـ cubit
          child: GeneratingView(
            personImage: map['image'] as File,
            args: map['args'] as VtoArguments,
          ),
        ),
      );

    case VtoResultView.routeName:
      final bytes = settings.arguments as Uint8List;
      return MaterialPageRoute(
        builder: (_) => VtoResultView(resultImageBytes: bytes),
      );


    default:
      return MaterialPageRoute(builder: (context) => const Scaffold());
  }
}
