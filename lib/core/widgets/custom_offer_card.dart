import 'package:flutter/material.dart';

import '../utils/app_images.dart';
import '../utils/app_style.dart';
import 'custom_button.dart';

class CustomOfferCard extends StatelessWidget {
  const CustomOfferCard({super.key});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.all(Radius.circular(16)),
      child: Container(
        width: 200,
        decoration: BoxDecoration(
          color: Color(0xffF3EEFB),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              spreadRadius: 2,
              blurRadius: 6,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          // mainAxisSize: MainAxisSize.max,
          children: [
            Container(
              width: double.infinity,
              height: 150,
              decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage(AppImages.bagImage),
                ),
              ),
            ),
            SizedBox(height: 8),
            Padding(
              padding: const EdgeInsets.only(left: 18, right: 18),
              child: Column(
                children: [
                  Text(
                    "Summer Collection Sale!",
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: AppStyle.styleMedium14,
                  ),
                  SizedBox(height: 8),
                  Text(
                    "Up to 30% off on selected summerlakjlfjlakjlkjlkjlk",
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: AppStyle.styleGreyRegular10,
                  ),
                  SizedBox(height: 8),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18),
              child: CustomButton(text: "View Offer", onTap: () {}, height: 32),
            ),
          ],
        ),
      ),
    );
  }
}