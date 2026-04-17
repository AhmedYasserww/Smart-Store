import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_store/features/profile/presentation/views/widgets/custom_profile_app_bar.dart';
import 'package:smart_store/features/wishlist/presentation/manager/get_wishlist_cubit/get_wishlist_cubit.dart';
import 'package:smart_store/features/wishlist/presentation/views/widgets/wishlist_view_body.dart';

import '../../../../core/service_locator/service_locator.dart';
import '../../data/repos/wishlist_repo_imp.dart';
class WishlistView extends StatelessWidget {
  const WishlistView({super.key});
static const String routeName = 'wishlist_view';
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_)=>GetWishlistCubit(getIt.get<WishlistRepoImpl>())..getWishlist(),
      child: Scaffold(
        appBar: CustomProfileAppBar(title: "Wishlist"),
        body:WishlistViewBody() ,
      ),
    );
  }
}
