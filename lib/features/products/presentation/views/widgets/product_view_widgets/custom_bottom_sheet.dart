import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../../core/utils/app_color.dart';
import '../../../../../../core/utils/app_images.dart';
import '../../../../../../core/utils/app_style.dart';

class CustomBottomSheet extends StatelessWidget {
  const CustomBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
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
      ],
    );
  }
}

class BottomSheetButtons extends StatelessWidget {
  const BottomSheetButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 96,
      width: double.infinity,
      decoration: BoxDecoration(
        color: Color(0xFFF9FAFA),
        border: Border.all(color: Color(0xFFE5E5E5)),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 32.0),
        child: Center(
          child: Row(
            children: [
              Expanded(
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    elevation: 3,
                    backgroundColor: Color(0xFFF3EEFB),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadiusGeometry.circular(8),
                    ),
                  ),

                  child: Text(
                    "Reset",
                    style: AppStyle.styleRegular16.copyWith(
                      color: Color(0xFF5D3A82),
                    ),
                  ),
                ),
              ),
              SizedBox(width: 16),
              Expanded(
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    elevation: 3,
                    backgroundColor: Color(0xFF5D3A82),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadiusGeometry.circular(8),
                    ),
                  ),

                  child: Text(
                    "Reset",
                    style: AppStyle.styleRegular16.copyWith(
                      color: Color(0xFFFFFFFF),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ColorsWidget extends StatelessWidget {
  const ColorsWidget({super.key});
  final List<Color> colorsList = const [
    Color(0xFFFFFFFF),
    Color(0xFFFFA8A7),
    Color(0xFFFF8080),
    Color(0xFF98E9CB),
    Color(0xFF4D845F),
    Color(0xFFA7B8DE),
    Color(0xFF698087),
    Color(0xFF000000),
  ];
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Colors", style: AppStyle.styleRegular16),
        SizedBox(height: 16),
        Row(
          children: colorsList.map((element) {
            return Expanded(
              child: Container(
                height: 40,
                decoration: BoxDecoration(
                  border: Border.all(color: Color(0xFFE5E5E5), width: 1),
                  borderRadius: BorderRadius.circular(8),
                  color: element,
                ),
              ),
            );
          }).toList(),
        ),
      ],
    );
  }
}

class SizesWidget extends StatelessWidget {
  const SizesWidget({super.key});
  final List<String> sizeList = const ['XS', 'S', 'M', 'L', 'XL', '2XL', '3XL'];
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Colors", style: AppStyle.styleRegular16),
        SizedBox(height: 16),
        Row(
          children: sizeList.map((element) {
            return Expanded(
              child: Container(
                height: 40,
                decoration: BoxDecoration(
                  border: Border.all(color: Color(0xFFE5E5E5), width: 1),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Center(
                  child: Text(
                    element,
                    style: AppStyle.styleGreyMedium14.copyWith(
                      color: Color(0xFF1A1515),
                    ),
                  ),
                ),
              ),
            );
          }).toList(),
        ),
      ],
    );
  }
}

class ReviewsWidget extends StatelessWidget {
  const ReviewsWidget({super.key});
  final List<String> reviewList = const ['1⭐', '2⭐', '3⭐', '4⭐', '5⭐'];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Colors", style: AppStyle.styleRegular16),
        SizedBox(height: 16),
        Row(
          children: reviewList.map((element) {
            return Expanded(
              child: Container(
                height: 40,
                decoration: BoxDecoration(
                  border: Border.all(color: Color(0xFFE5E5E5), width: 1),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Center(
                  child: Text(
                    element,
                    style: AppStyle.styleGreyMedium14.copyWith(
                      color: Color(0xFF1A1515),
                    ),
                  ),
                ),
              ),
            );
          }).toList(),
        ),
      ],
    );
  }
}

class PriceRange extends StatelessWidget {
  const PriceRange({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Price Range", style: AppStyle.styleRegular16),
        SizedBox(height: 16),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          spacing: 16,
          children: [
            Expanded(
              child: Container(
                height: 40,

                decoration: BoxDecoration(
                  border: Border.all(color: Color(0xFFE5E5E5), width: 1),
                  borderRadius: BorderRadius.circular(6),
                ),
                child: Center(
                  child: Text("Min Price", style: AppStyle.styleRegular12),
                ),
              ),
            ),

            Expanded(
              child: Container(
                height: 40,

                decoration: BoxDecoration(
                  border: Border.all(color: Color(0xFFE5E5E5), width: 1),
                  borderRadius: BorderRadius.circular(6),
                ),
                child: Center(
                  child: Text("Max Price", style: AppStyle.styleRegular12),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class HeadOfBottomSheet extends StatelessWidget {
  const HeadOfBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text("Filters", style: AppStyle.styleBold20),
        Spacer(),
        GestureDetector(
          onTap: () => Navigator.pop(context),
          child: SvgPicture.asset(AppImages.exitIcon),
        ),
      ],
    );
  }
}


