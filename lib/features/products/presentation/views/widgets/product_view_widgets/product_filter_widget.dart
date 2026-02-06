import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:smart_store/features/products/presentation/views/widgets/product_view_widgets/product_button.dart';

import '../../../../../../core/utils/app_images.dart';
import '../../../../../../core/utils/app_style.dart';
import 'custom_bottom_sheet_widget/custom_bottom_sheet.dart';
import 'filter_widget.dart';
class ProductFilterWidget extends StatelessWidget {
  const ProductFilterWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Column(
        children: [
          SizedBox(height: 8),
          Row(
            children: [
              SvgPicture.asset(AppImages.filterIcon1),
              SizedBox(width: 10),
              Text("Filter", style: AppStyle.styleMedium14),
              Spacer(),
              GestureDetector(
                onTap: () {
                  showModalBottomSheet(
                    context: context,
                    isScrollControlled: true,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadiusGeometry.vertical(
                        top: Radius.circular(24),
                      ),
                    ),
                    builder: (context) {
                      return CustomBottomSheet();
                    },
                  );
                },
                child: SvgPicture.asset(AppImages.filterIcon2),
              ),
            ],
          ),
          SizedBox(height: 8),
          FilterWidget(),
          SizedBox(height: 8),
          Divider(height: 0, color: Color(0xFFE5E5E5)),
          SizedBox(height: 8),
          ProductButton(),
          SizedBox(height: 24),
        ],
      ),
    );
  }
}
