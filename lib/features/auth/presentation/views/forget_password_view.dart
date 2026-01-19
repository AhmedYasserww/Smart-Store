import 'package:flutter/material.dart';
import 'package:smart_store/features/auth/presentation/views/widgets/forget_password_view_body.dart';

class ForgetPasswordView extends StatelessWidget {
  const ForgetPasswordView({super.key});

  static const String routeName = 'forget-password';

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
      body: ForgetPasswordViewBody(),
    );
  }
}
