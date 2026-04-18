import 'package:flutter/material.dart';
import 'package:smart_store/features/profile/presentation/views/widgets/custom_profile_app_bar.dart';
import 'package:smart_store/features/wishlist/presentation/views/widgets/wishlist_view_body.dart';
class WishlistView extends StatelessWidget {
  const WishlistView({super.key});
static const String routeName = 'wishlist_view';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomProfileAppBar(title: "Wishlist"),
      body:WishlistViewBody() ,
    );
  }
}
