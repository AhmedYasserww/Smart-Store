import 'package:flutter/material.dart';
import 'package:smart_store/features/auth/presentation/views/widgets/reset_password_view_body.dart';
class ResetPasswordView extends StatelessWidget {
  const ResetPasswordView({super.key});
  static const String routeName = 'reset_password_view';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back_ios_new),
        ),
      ),
      body: ResetPasswordViewBody(),
    );
  }
}
