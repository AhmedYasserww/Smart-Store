import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../../../../../core/utils/app_images.dart';
import '../../../../../../core/utils/app_style.dart';

class BecomeSellerWidget extends StatelessWidget {
  const BecomeSellerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 92,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        image: DecorationImage(
          image: AssetImage(AppImages.info2Image),
          fit: BoxFit.cover,
        ),
      ),
      alignment: Alignment.center,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: ListTile(
          onTap: () {},
          leading: Container(
            height: 40,
            width: 40,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: Color(0xFFFFFFFF).withOpacity(0.1),
            ),
            alignment: Alignment.center,
            child: SvgPicture.asset(
              AppImages.sellerIcon,
              height: 20,
              width: 20,
              fit: BoxFit.contain,
            ),
          ),
          title: Text(
            "Become a Seller",
            style: AppStyle.styleBold16.copyWith(color: Color(0xFFFFFFFF)),
          ),
          subtitle: Text(
            "Start selling your products today",
            style: AppStyle.styleRegular14.copyWith(color: Color(0xFFFFFFFF)),
          ),
          trailing: Icon(
            Icons.arrow_forward_ios,
            size: 16,
            color: Color(0xFFFFFFFF),
          ),
        ),
      ),
    );
  }
}
