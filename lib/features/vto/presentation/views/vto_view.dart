import 'package:flutter/material.dart';
import 'package:smart_store/core/widgets/custom_app_bar.dart';
import 'package:smart_store/features/vto/presentation/views/widgets/vto_view_body.dart';
class VtoView extends StatelessWidget {
  const VtoView({super.key});
  static const String routeName = 'vto_view';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:CustomAppBar(title: "Virtual Try on"),
      body: VtoViewBody(),
    );
  }
}

