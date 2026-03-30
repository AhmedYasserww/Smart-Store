import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:smart_store/features/products/presentation/manager/get_all_product_cubit.dart';
import 'package:smart_store/features/products/presentation/views/widgets/product_view_widgets/product_button.dart';

import '../../../../../../core/utils/app_color.dart';
import '../../../../../../core/utils/app_images.dart';
import '../../../../../../core/utils/app_style.dart';
import 'custom_bottom_sheet_widget/custom_bottom_sheet.dart';
import 'custom_category_widget.dart';

class ProductFilterWidget extends StatelessWidget {
  const ProductFilterWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: BlocBuilder<GetAllProductCubit, GetAllProductState>(
        builder: (context, state) {
          final cubit = context.read<GetAllProductCubit>();

          return Column(
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
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.vertical(
                            top: Radius.circular(24),
                          ),
                        ),
                        builder: (context) {
                          return CustomBottomSheet(
                            initialParams: cubit.currentParams,
                            availableSizes: cubit.getAllSizes(),
                            availableColors: cubit.getAllColors(),
                            onApply: (params) {
                              cubit.fetchAllProducts(params: params);
                              Navigator.pop(context);
                            },
                            onReset: () {
                              cubit.resetFilters();
                              Navigator.pop(context);
                            },
                          );
                        },
                      );
                    },
                    child: SvgPicture.asset(AppImages.filterIcon2),
                  ),
                ],
              ),
              SizedBox(height: 8),
              CustomCategoryWidget(),
              SizedBox(height: 8),
              Divider(height: 0, color: AppColors.palletBorderColor),
              SizedBox(height: 8),
              ProductToggleButton(),
              SizedBox(height: 24),
            ],
          );
        },
      ),
    );
  }
}