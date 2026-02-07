import 'package:flutter/material.dart';
import 'package:smart_store/core/utils/app_style.dart';
class VtoViewBody extends StatelessWidget {
  const VtoViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text("Virtual Try on",style: AppStyle.styleSemiBold18,),
    );
  }
}
