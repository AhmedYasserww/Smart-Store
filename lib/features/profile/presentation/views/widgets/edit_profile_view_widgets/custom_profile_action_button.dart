import 'package:flutter/material.dart';
import '../../../../../../core/utils/app_color.dart';
import '../../../../../../core/widgets/custom_button.dart';

class CustomProfileActionButtons extends StatelessWidget {
  const CustomProfileActionButtons({
    super.key,
    required this.onDeleteTap,
    required this.onSaveTap,
    this.saveButtonColor,
    this.textButton1,
    this.textButton2,
  });

  final VoidCallback onDeleteTap;
  final VoidCallback onSaveTap;
  final Color? saveButtonColor;
  final String? textButton1;
  final String? textButton2;

  @override
  Widget build(BuildContext context) {
    final ValueNotifier<bool> deletePressed =
    ValueNotifier(false);

    final ValueNotifier<bool> savePressed =
    ValueNotifier(false);

    return Row(
      children: [
        Expanded(
          child: ValueListenableBuilder<bool>(
            valueListenable: deletePressed,
            builder: (context, pressed, child) {
              return GestureDetector(
                onTapDown: (_) =>
                deletePressed.value = true,
                onTapUp: (_) =>
                deletePressed.value = false,
                onTapCancel: () =>
                deletePressed.value = false,
                onTap: onDeleteTap,
                child: AnimatedContainer(
                  duration:
                  const Duration(
                    milliseconds: 120,
                  ),
                  curve: Curves.easeOut,
                  transform:
                  Matrix4.identity()
                    ..translate(
                      0.0,
                      pressed
                          ? 3.0
                          : 0.0,
                    )
                    ..scale(
                      pressed
                          ? 0.97
                          : 1.0,
                    ),
                  child: CustomButton(
                    buttonColor:
                    Colors.white,
                    textButtonColor:
                    AppColors
                        .primaryTextColor,
                    border: Border.all(
                      color: AppColors
                          .palletBorderColor,
                    ),
                    text:
                    textButton1 ??
                        "Delete",
                    onTap: () {},
                  ),
                ),
              );
            },
          ),
        ),
        const SizedBox(width: 16),
        Expanded(
          child: ValueListenableBuilder<bool>(
            valueListenable: savePressed,
            builder: (context, pressed, child) {
              return GestureDetector(
                onTapDown: (_) =>
                savePressed.value = true,
                onTapUp: (_) =>
                savePressed.value = false,
                onTapCancel: () =>
                savePressed.value = false,
                onTap: onSaveTap,
                child: AnimatedContainer(
                  duration:
                  const Duration(
                    milliseconds: 120,
                  ),
                  curve: Curves.easeOut,
                  transform:
                  Matrix4.identity()
                    ..translate(
                      0.0,
                      pressed
                          ? 3.0
                          : 0.0,
                    )
                    ..scale(
                      pressed
                          ? 0.97
                          : 1.0,
                    ),
                  child: CustomButton(
                    buttonColor:
                    saveButtonColor ??
                        AppColors
                            .primaryColor,
                    text:
                    textButton2 ??
                        "Save Changes",
                    onTap: () {},
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}