import 'package:flutter/material.dart';
import 'package:smart_store/features/search/presentation/views/widgets/search_result.dart';
import 'search_header.dart';
class SearchViewBody extends StatelessWidget {
  const SearchViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children:  [
        SearchHeader(),

        Expanded(
          child: SearchResults(),
        ),
      ],
    );
  }
}