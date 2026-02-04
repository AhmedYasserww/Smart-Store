import 'package:flutter/material.dart';
import 'package:smart_store/features/home/presentation/views/widgets/home_view_body.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  static const String routeName = 'home_view';

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: const Scaffold(body: HomeViewBody()));
  }
}
