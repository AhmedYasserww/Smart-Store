import 'package:flutter/material.dart';
import 'package:smart_store/features/home/presentation/views/widgets/product_list_view.dart';
import 'package:smart_store/features/home/presentation/views/widgets/section_title.dart';

import '../../../../../core/utils/app_dimensions.dart';
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
          children: const [
            SizedBox(height: _sectionSpacing),
            CustomSearchField(),

            SizedBox(height: _sectionSpacing),
            Divider(height: 0, color: Color(0xFFE5E5E5)),

            SizedBox(height: _sectionSpacing),
            CategoryWidget(),

            SizedBox(height: _sectionSpacing),
            SectionTitle(title: 'Exclusive Offers'),

            SizedBox(height: _sectionSpacing),
            OfferCardListView(),

            SizedBox(height: _largeSpacing),
            SectionTitle(title: 'Recently Viewed'),

            SizedBox(height: _sectionSpacing),
            ProductListview(),

            SizedBox(height: 8),
            SectionTitle(title: 'Recommended For You'),

            SizedBox(height: _sectionSpacing),
            ProductListview(),
          ],
        ),
      ),
    );
  }
}