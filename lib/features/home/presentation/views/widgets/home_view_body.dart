import 'package:flutter/material.dart';
import 'package:smart_store/features/home/presentation/views/widgets/product_list_view.dart';
import 'package:smart_store/features/home/presentation/views/widgets/section_title.dart';

import '../../../../../core/utils/app_dimensions.dart';
import '../../../../search/presentation/views/search_view.dart';
import 'category_widget.dart';
import 'custom_search_field.dart';
import 'offer_card_list_view.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  static const double _sectionSpacing = 16;
  static const double _largeSpacing = 24;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: AppDimensions.homeScreenPadding,
      ),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: _sectionSpacing),
            CustomSearchField(
              readOnly: true,
              onTap: () {
                Navigator.of(context).pushNamed(SearchView.routeName);
              },
            ),
            const SizedBox(height: _sectionSpacing),
            const Divider(height: 0, color: Color(0xFFE5E5E5)),

            const SizedBox(height: _sectionSpacing),
            const CategoryWidget(),

            const SizedBox(height: _sectionSpacing),
            const SectionTitle(title: 'Exclusive Offers'),

            const SizedBox(height: _sectionSpacing),
            const  OfferCardListView(),

            const  SizedBox(height: _largeSpacing),
            const SectionTitle(title: 'Recently Viewed'),

            const SizedBox(height: _sectionSpacing),
            const ProductListview(),

            const SizedBox(height: 8),
            const SectionTitle(title: 'Recommended For You'),

            const SizedBox(height: _sectionSpacing),
            const ProductListview(),
          ],
        ),
      ),
    );
  }
}
