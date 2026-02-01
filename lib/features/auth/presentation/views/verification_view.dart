import 'package:flutter/material.dart';
import 'package:smart_store/features/auth/presentation/views/widgets/verification_view_body.dart';
class VerificationView extends StatelessWidget {
  const VerificationView({super.key});
  static const String routeName = 'verification_view';

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
      body: VerificationViewBody(),
    );
  }
}
