import 'package:flutter/material.dart';
import 'package:smart_store/core/utils/app_color.dart';
import 'package:smart_store/core/utils/app_style.dart';

import '../../../../../../core/utils/app_dimensions.dart';
class SavedAddressViewBody extends StatelessWidget {
  const SavedAddressViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding:  EdgeInsets.symmetric(horizontal: AppDimensions.homeScreenPadding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 32,
            ),
            Text("Saved Address",style: AppStyle.styleBold16,),
            SizedBox(
              height: 24,
            ),
            CustomSavedAddressItem()
          ],
        ),
      ),
    );
  }
}
class CustomSavedAddressItem extends StatelessWidget {
  const CustomSavedAddressItem({super.key});

  @override
  Widget build(BuildContext context) {
    return  Container(
      padding: const EdgeInsets.all(24),
      decoration: ShapeDecoration(
        color: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        shadows: [
          BoxShadow(
            color: Color(0x3F000000),
            blurRadius: 2,
            offset: Offset(0, 0),
            spreadRadius: 0,
          )
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: 16,
        children: [
          Text(
            'Danial Joe',
            style: AppStyle.styleBold16,
          ),
          Text(
            '01012312312',
            style: AppStyle.styleGreyRegular12,
          ),
          Text(
            '12 Nile Road, Cairo',
            style: AppStyle.styleGreyMedium12,
          ),
        Divider(
          thickness: 1,
          color: AppColors.palletBorderColor,
          height: 0,
        ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            spacing: 128,
            children: [
              GestureDetector(
                onTap: (){},
                child: Text(
                  'Edit',
                  style: AppStyle.styleSemiBold14,

                ),
              ),
              GestureDetector(
                onTap: (){

                },
                child: Text(
                  'Delete',
                  style: AppStyle.styleSemiBold14,
                ),
              ),
            ],
          ),
        ],
      ),
    );

  }
}
