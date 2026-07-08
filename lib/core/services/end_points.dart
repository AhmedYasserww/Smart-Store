class EndPoints {
  static const String registerClient = "Account/register/client";
  static const String login = "Account/login";
  static const String logout = 'Account/logout';
  static const String confirmEmail = "Account/confirm-email";
  static const String resendOtp = "Account/resend-otp";
  static const String forgetPassword = "Account/forget-password";
  static const String confirmResetPassword = "Account/confirm-reset-password";
  static const String resetPassword = "Account/reset-password";
  static const String getAllProducts = "Products";
  static const String getRecentlyViewedProducts =
      "Products/recently-viewed";
  static const String getAllCategories = "Categories";
  static const String searchForProduct = "Products/search/on/products";
  static const String addToCart = "Cart/client/add/to/cart";
  static const String getCart = 'Cart/get/client/cart';
  static String deleteFromCart(String itemId) =>
      'Cart/delete/client/cart/$itemId';
  static const String updateCartItem = 'Cart/client/items';
  static const String getWishlist = 'Wishlist/get/client/wishlist';
  static const String addToWishlist = 'Wishlist/client/add/to/wishlist';
  static String removeFromWishlist(String itemId) =>
      'Wishlist/client/remove/item/$itemId';
  static const String getProfile = 'ClientProfile/get/client/profile';
  static const String changePassword = 'Account/change-password';
  static const String addAddress = 'DeliveryAddress/client/add/address';
  static const String getAddresses = 'DeliveryAddress/get/client/addresses';
  static String updateAddress(String addressId) =>
      'DeliveryAddress/client/update/address/$addressId';
  static const String createOrder = 'Order/create';
  static const String getDeliveryOptions =
      'DelivryOptions/all/delevery-options';
  static String deleteAddress(String addressId) =>
      'DeliveryAddress/client/delete/address/$addressId';
  static const String createPaymentIntent = 'Payment/create-payment-intent';
  static const String clearCart = 'Cart/client/clear/cart';
  static const String orderDetails = 'Order/details';
  static const String getOrders = 'Order/client/orders';
  static const String cancelOrder = 'Order/cancel';
  static const String tryOn = 'TryOn/fashn';
  static const String getRecommendations = 'Recommendation/similar';
  static const String googleLogin = '/Account/client/google';
  static const String editProfile = 'ClientProfile/client/update/profile';

  static const String getRecentlyAdded = 'Home/recently-added';
  static const String getTopSelling = 'Home/top-selling';
  static const String getWishListHighlights = 'Home/wishlist-highlights';
  static const String chatbot = 'Chatbot/ask';
}
