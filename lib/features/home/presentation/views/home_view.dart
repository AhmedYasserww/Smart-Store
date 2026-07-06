import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_store/core/service_locator/service_locator.dart';
import 'package:smart_store/features/home/presentation/manager/RecentlyHomeCubit/recently_home_cubit.dart';
import 'package:smart_store/features/home/presentation/manager/highlights_home_cubit/highlights_home_cubit.dart';
import 'package:smart_store/features/home/presentation/top_selling_cubit/top_selling_home_cubit.dart';
import 'package:smart_store/features/home/presentation/views/widgets/home_view_body.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  static const String routeName = 'home_view';

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => getIt<RecentlyHomeCubit>()..getRecentlyViewdProduct(),
        ),
        BlocProvider(
          create: (_) => getIt<HighlightsHomeCubit>()..getHighlightsProducts(),
        ),
        BlocProvider(
          create: (_) => getIt<TopSellingHomeCubit>()..getTopSellingProducts(),
        ),
      ],
      child: const SafeArea(child: Scaffold(body: HomeViewBody())),
    );
  }
}
