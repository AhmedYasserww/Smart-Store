import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/utils/app_color.dart';
import '../../../../../core/utils/app_dimensions.dart';
import '../../../../home/presentation/views/widgets/custom_search_field.dart';
import '../../manager/search_for_product_cubit/search_for_product_cubit.dart';

class SearchHeader extends StatelessWidget {
  SearchHeader({super.key});

  final TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      bottom: false,
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: AppDimensions.homeScreenPadding,
          vertical: 16,
        ),
        child: Column(
          children: [
            Row(
              children: [
                IconButton(
                  onPressed: () => Navigator.pop(context),
                  icon: const Icon(Icons.arrow_back_ios),
                ),
                const SizedBox(width: 8),

                Expanded(
                  child: CustomSearchField(
                    controller: controller,
                    autofocus: true,
                    onChanged: (value) {
                      context
                          .read<SearchForProductCubit>()
                          .searchForProduct(value);
                    },
                    onSuffixIconTap: () {
                      controller.clear();
                      context
                          .read<SearchForProductCubit>()
                          .searchForProduct('');
                    },
                  ),
                ),
              ],
            ),
            SizedBox(height: 16,),
            Divider(
              height: 1,
              thickness: 2,
              color: AppColors.palletBorderColor,
            ),

          ],
        ),
      ),
    );
  }
}