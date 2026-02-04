import 'package:flutter/material.dart';
import 'package:smart_store/core/utils/app_style.dart';
import 'package:smart_store/features/home/presentation/views/widgets/custom_search_field.dart';

import '../../../../../core/utils/app_color.dart';
import '../../../../../core/utils/app_dimensions.dart';

class SearchViewBody extends StatelessWidget {
  const SearchViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SafeArea(
          bottom: false,
          child: Padding(
            padding:  EdgeInsets.symmetric(horizontal: AppDimensions.homeScreenPadding,vertical: 16),
            child: Row(
              children: [

                IconButton(
                  onPressed: () => Navigator.pop(context),
                  icon: Icon(
                    Icons.arrow_back_ios,
                    size: 24,
                    color: AppColors.primaryTextColor,
                  ),
                ),

                const SizedBox(width: 8),

                const Expanded(
                  child: CustomSearchField(
                    autofocus: true,
                  ),
                ),
              ],
            ),
          ),
        ),

        /// Divider full width
        const Divider(
          height: 1,
          thickness: 1,
          color: Color(0xFFE5E5E5),
        ),

         Expanded(
          child: Center(
            child: Text(
              'Search results here',
              style: AppStyle.styleSemiBold16,
            ),
          ),
        ),
      ],
    );
  }
}
