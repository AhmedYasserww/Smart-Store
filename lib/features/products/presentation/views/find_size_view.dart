import 'package:flutter/material.dart';
import 'package:smart_store/features/products/presentation/views/widgets/find_size_view_body.dart';
class FindSizeView extends StatelessWidget {
  const FindSizeView({super.key});
static const String routeName = 'find-size_view';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back_ios_new),
        ),
      ),
      body: FindSizeViewBody(),
    );
  }
}
