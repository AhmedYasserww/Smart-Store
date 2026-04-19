class EndPoints {
  static const String registerClient = "Account/register/client";
  static const String login = "Account/login";
  static const String logout = "Account/logout";
  static const String confirmEmail = "Account/confirm-email";
  static const String resendOtp = "Account/resend-otp";
  static const String forgetPassword = "Account/forget-password";
  static const String confirmResetPassword = "Account/confirm-reset-password";
  static const String resetPassword = "Account/reset-password";
  static const String getAllProducts = "Products";
  static const String getRecentlyViewedProducts =
      "Products/client/recently-viewed";
  static const String getAllCategories = "Categories";
  static const String searchForProduct = "Products/search/on/products";
  static const String addToCart = "Cart/client/add/to/cart";
  static const String getCart = 'Cart/get/client/cart';
  static String deleteFromCart(String itemId) => 'Cart/delete/client/cart/$itemId';
  static const String updateCartItem = 'Cart/client/update/cartItem';
  static const String getWishlist = 'Wishlist/get/client/wishlist';
  static const String addToWishlist = 'Wishlist/client/add/to/wishlist';
  static String removeFromWishlist(String itemId) => 'Wishlist/client/remove/item/$itemId';
  static const String getProfile = 'ClientProfile/get/client/profile';
  static const String changePassword = 'Account/change-password';
  static const String addAddress = 'DeliveryAddress/client/add/address';
  static const String getAddresses = 'DeliveryAddress/get/client/addresses';
}
