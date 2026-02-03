import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:smart_store/features/home/presentation/views/home_view.dart';
import '../../../../../../core/utils/app_style.dart';
import '../../../../../../core/widgets/custom_button.dart';

class SuccessDialog extends StatelessWidget {
  const SuccessDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(24),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 48, vertical: 40),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SvgPicture.asset(
              'assets/images/success_icon.svg',
            ),
            const SizedBox(height: 24),

            Text(
              'Success',
              style: AppStyle.styleBold24,
            ),
            const SizedBox(height: 8),

            Text(
              'You have successfully reset your password.',
              textAlign: TextAlign.center,
              style: AppStyle.styleGreyRegular16,
            ),
            const SizedBox(height: 32),

            CustomButton(
              text: 'Done',
              onTap: () {
             Navigator.of(context).pushNamed(HomeView.routeName);
              },
            ),
          ],
        ),
      ),
    );
  }
}
