import 'package:flutter/material.dart';
import 'package:smart_store/features/products/data/models/product_query_params_model.dart';
import 'package:smart_store/features/products/presentation/views/widgets/product_view_widgets/custom_bottom_sheet_widget/price_range_widget.dart';
import 'package:smart_store/features/products/presentation/views/widgets/product_view_widgets/custom_bottom_sheet_widget/reviews_widget.dart';
import 'package:smart_store/features/products/presentation/views/widgets/product_view_widgets/custom_bottom_sheet_widget/sizes_widget.dart';

import 'bottom_shhet_buttons.dart';
import 'color_widget.dart';
import 'drag_handle_widget.dart';
import 'head_of_bottom_sheet.dart';

class CustomBottomSheet extends StatefulWidget {
  const CustomBottomSheet({
    super.key,
    required this.initialParams,
    required this.availableSizes,
    required this.onApply,
    required this.onReset,
  });

  final ProductQueryParams initialParams;
  final List<SizeFilterOption> availableSizes;
  final ValueChanged<ProductQueryParams> onApply;
  final VoidCallback onReset;

  @override
  State<CustomBottomSheet> createState() => _CustomBottomSheetState();
}

class _CustomBottomSheetState extends State<CustomBottomSheet> {
  int? minPrice;
  int? maxPrice;
  String? selectedColor;
  int? selectedRating;
  late Set<String> selectedSizeIds;

  @override
  void initState() {
    super.initState();
    minPrice = widget.initialParams.minPrice;
    maxPrice = widget.initialParams.maxPrice;
    selectedColor = widget.initialParams.color;
    selectedRating = widget.initialParams.rating;
    selectedSizeIds = widget.initialParams.sizeIds.toSet();
  }

  void _applyFilters() {
    final hasInvalidRange =
        minPrice != null && maxPrice != null && minPrice! > maxPrice!;

    if (hasInvalidRange) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Min price cannot be greater than max price.'),
        ),
      );
      return;
    }

    widget.onApply(
      widget.initialParams.copyWith(
        minPrice: minPrice,
        maxPrice: maxPrice,
        color: selectedColor,
        sizeIds: selectedSizeIds.toList(),
        rating: selectedRating,
      ),
    );
  }

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
                PriceRange(
                  initialMinPrice: minPrice,
                  initialMaxPrice: maxPrice,
                  onMinChanged: (value) => minPrice = value,
                  onMaxChanged: (value) => maxPrice = value,
                ),
                SizedBox(height: 24),
                ColorsWidget(
                  selectedColor: selectedColor,
                  onColorSelected: (value) {
                    setState(() {
                      selectedColor = value;
                    });
                  },
                ),
                SizedBox(height: 24),
                SizesWidget(
                  options: widget.availableSizes,
                  selectedSizeIds: selectedSizeIds,
                  onToggle: (sizeId) {
                    setState(() {
                      if (selectedSizeIds.contains(sizeId)) {
                        selectedSizeIds.remove(sizeId);
                      } else {
                        selectedSizeIds.add(sizeId);
                      }
                    });
                  },
                ),
                SizedBox(height: 24),
                ReviewsWidget(
                  selectedRating: selectedRating,
                  onRatingSelected: (rating) {
                    setState(() {
                      selectedRating = rating;
                    });
                  },
                ),
                SizedBox(height: 24),
              ],
            ),
          ),
          BottomSheetButtons(onReset: widget.onReset, onApply: _applyFilters),
          SizedBox(height: 24),
        ],
      ),
    );
  }
}
