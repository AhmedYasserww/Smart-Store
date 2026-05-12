import 'package:flutter/material.dart';
import 'package:smart_store/features/more/profile/presentation/views/widgets/custom_profile_app_bar.dart';
import 'package:smart_store/features/more/saved_address/presentation/views/widgets/saved_address_view_body.dart';
class SavedAddressView extends StatelessWidget {
  const SavedAddressView({super.key});
  static const String routeName = 'saved_address_view';

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: CustomProfileAppBar(title: "Saved Address"),
      body: const SavedAddressViewBody(),
    );

  }
}
