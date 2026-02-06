import 'package:flutter/material.dart';
import 'package:smart_store/features/products/presentation/views/widgets/product_view_widgets/custom_bottom_sheet_widget/price_range_widget.dart';
import 'package:smart_store/features/products/presentation/views/widgets/product_view_widgets/custom_bottom_sheet_widget/reviews_widget.dart';
import 'package:smart_store/features/products/presentation/views/widgets/product_view_widgets/custom_bottom_sheet_widget/sizes_widget.dart';
import 'bottom_shhet_buttons.dart';
import 'color_widget.dart';
import 'drag_handle_widget.dart';
import 'head_of_bottom_sheet.dart';

class CustomBottomSheet extends StatelessWidget {
  const CustomBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(24),
          topRight: Radius.circular(24),
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 24),
                DragHandleWidget(),
                SizedBox(height: 16),
                HeadOfBottomSheet(),
                SizedBox(height: 16),
                PriceRange(),
                SizedBox(height: 24),
                ColorsWidget(),
                SizedBox(height: 24),
                SizesWidget(),
                SizedBox(height: 24),
                ReviewsWidget(),
                SizedBox(height: 24),
              ],
            ),
          ),
          BottomSheetButtons(),
          SizedBox(height: 24),
        ],
      ),
    );
  }
}













