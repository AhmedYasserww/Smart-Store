import 'package:flutter/material.dart';
import 'package:smart_store/features/search/presentation/views/widgets/search_view_body.dart';

import '../../../../core/utils/app_style.dart';

class SearchView extends StatelessWidget {
  const SearchView({super.key});
  static const String routeName = 'search_view';

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SearchViewBody()
    );
  }
}

