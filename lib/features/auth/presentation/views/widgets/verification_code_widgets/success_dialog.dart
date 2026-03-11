import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../../../../core/utils/app_style.dart';
import '../../../../../../core/widgets/custom_button.dart';
import '../../../../../bottom_nav_bar/presentation/views/bottom_nav_bar_view.dart';

class SuccessDialog extends StatelessWidget {
  const SuccessDialog({super.key, required this.message});
  final String message ;

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
              message,
          //    'You have successfully reset your password.',
              textAlign: TextAlign.center,
              style: AppStyle.styleGreyRegular16,
            ),
            const SizedBox(height: 32),

            CustomButton(
              text: 'Done',
              onTap: () {
           Navigator.of(context).pushNamedAndRemoveUntil(CustomNavigationBar.routeName, (route) => false);
              },
            ),
          ],
        ),
      ),
    );
  }
}
