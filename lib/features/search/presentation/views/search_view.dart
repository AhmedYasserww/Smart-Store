import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_store/core/service_locator/service_locator.dart';
import 'package:smart_store/features/search/presentation/manager/search_for_product_cubit/search_for_product_cubit.dart';
import 'package:smart_store/features/search/presentation/views/widgets/search_view_body.dart';

class SearchView extends StatelessWidget {
  const SearchView({super.key});
  static const String routeName = 'search_view';

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<SearchForProductCubit>(),
      child: const Scaffold(
        body: SearchViewBody(),
      ),
    );
  }
}