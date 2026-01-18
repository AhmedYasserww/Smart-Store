import 'package:flutter/material.dart';
import 'package:smart_store/features/auth/presentation/views/widgets/log_in_view_body.dart';
class LogInView extends StatelessWidget {
  const LogInView({super.key});
  static const routeName = 'sign-in';

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: LogInViewBody(),
    );
  }
}
