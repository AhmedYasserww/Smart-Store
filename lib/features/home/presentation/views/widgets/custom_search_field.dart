import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../../../core/utils/app_images.dart';
import '../../../../../core/utils/app_style.dart';

class CustomSearchField extends StatelessWidget {
  const CustomSearchField({
    super.key,
    this.controller,
    this.readOnly = false,
    this.autofocus = false,
    this.onTap,
    this.onChanged,
    this.hintText = 'Search on Smart Store...',
  });

  final TextEditingController? controller;
  final bool readOnly;
  final bool autofocus;
  final VoidCallback? onTap;
  final ValueChanged<String>? onChanged;
  final String hintText;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      readOnly: readOnly,
      autofocus: autofocus,
      onTap: onTap,
      onChanged: onChanged,
      decoration: InputDecoration(
        filled: true,
        fillColor: const Color(0xffF9FAFA),

        border: _buildBorder(),
        enabledBorder: _buildBorder(),
        focusedBorder: _buildBorder(),
        disabledBorder: _buildBorder(),

        isDense: true,
        contentPadding: EdgeInsets.zero,

        /// 🔍 search icon
        prefixIcon: SizedBox(
          height: 17,
          width: 17,
          child: Center(
            child: SvgPicture.asset(
              AppImages.searchIcon,
            ),
          ),
        ),

        hintText: hintText,
        hintStyle: AppStyle.styleGreyRegular14,

        /// 🎤 + 📷
        suffixIcon: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            IconButton(
              onPressed: () {},
              icon: SvgPicture.asset(AppImages.scanImage),
            ),
            IconButton(
              onPressed: () {},
              icon: SvgPicture.asset(AppImages.micImage),
            ),
          ],
        ),
      ),
    );
  }

  OutlineInputBorder _buildBorder() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
      borderSide: const BorderSide(
        color: Color(0xFF666666),
        width: 1,
      ),
    );
  }
}
