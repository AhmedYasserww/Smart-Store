import 'package:flutter/material.dart';

import '../../../../../../core/utils/app_color.dart';
import '../../../../../../core/utils/app_style.dart';
import '../../../../../../core/widgets/custom_button.dart';

class BackAndContinueButtons extends StatelessWidget {
  const BackAndContinueButtons({
    super.key,
    required this.isEnabled,
    required this.onContinue,
    this.continueButtonColor,
    this.title,  this.isSavedLoading = false,
  });

  final bool isEnabled;
  final VoidCallback onContinue;
  final Color? continueButtonColor;
  final String? title;
  final bool isSavedLoading;

  @override
  Widget build(BuildContext context) {
    final ValueNotifier<bool> backPressed =
    ValueNotifier(false);

    return SafeArea(
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 32,
          vertical: 12,
        ),
        decoration: ShapeDecoration(
          color: const Color(0xFFF9FAFA),
          shape: RoundedRectangleBorder(
            side: BorderSide(
              width: 1,
              color: AppColors.palletBorderColor,
            ),
          ),
        ),
        child: Row(
          children: [
            Expanded(
              child: ValueListenableBuilder<bool>(
                valueListenable: backPressed,
                builder:
                    (context, pressed, child) {
                  return GestureDetector(
                    onTapDown: (_) =>
                    backPressed.value = true,
                    onTapUp: (_) =>
                    backPressed.value = false,
                    onTapCancel: () =>
                    backPressed.value = false,
                    onTap: () =>
                        Navigator.pop(context),
                    child: AnimatedContainer(
                      duration:
                      const Duration(
                        milliseconds: 120,
                      ),
                      curve: Curves.easeOut,
                      transform:
                      Matrix4.identity()..translate(0.0, pressed ? 3.0 : 0.0,)..scale(pressed ? 0.97 : 1.0,),
                      child: CustomButton(
                        border: Border.all(
                          color: AppColors.palletBorderColor,),
                        buttonColor: const Color(0xFFF3EEFB,),
                        text: 'Back',
                        textButtonColor: AppColors.primaryColor,
                        onTap: (){
                          Navigator.pop(context);
                        },
                      ),
                    ),
                  );
                },
              ),
            ),
            const SizedBox(width: 12),

            Expanded(
              child: isEnabled ? CustomButton(
                isLoading:isSavedLoading ,
                text: title ?? 'Continue',
                buttonColor: continueButtonColor ?? AppColors.primaryColor,
                textButtonColor: Colors.white,
                onTap: onContinue,
              ) : AnimatedContainer(
                duration: const Duration(milliseconds: 220,),
                height: 48,
                decoration: BoxDecoration(borderRadius:
                  BorderRadius.circular(8,),
                  color: const Color(0x7F5D3A82,),
                ),
                alignment: Alignment.center,
                child: const Text('Continue', style: AppStyle.styleWhiteRegular16,),
              ),
            ),
          ],
        ),
      ),
    );
  }
}