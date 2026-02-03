import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:smart_store/core/utils/app_style.dart';
import 'package:smart_store/features/home/presentation/views/widgets/search_field.dart';
import '../../../../../core/utils/app_images.dart';

class CustomSearchField extends StatelessWidget {
  const CustomSearchField({super.key});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      readOnly: true,
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => const SearchView(),
          ),
        );
      },
      decoration: InputDecoration(
        filled: true,
        fillColor: const Color(0xffF9FAFA),

        border: _buildBorder(),
        enabledBorder: _buildBorder(),
        focusedBorder: _buildBorder(),
        disabledBorder: _buildBorder(),
        isDense: true,
        contentPadding: EdgeInsets.zero,

        /// 🔍 Search icon
        prefixIcon: SizedBox(
          height: 17,
            width: 17,
            child: Center(child: SvgPicture.asset(AppImages.searchIcon,))),

        hintText: "Search on Smart Store...",
        hintStyle:AppStyle.styleGreyRegular14,

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
      borderSide: BorderSide(
        color: const Color(0xFF666666),
        width: 1,
      ),
    );
  }
}
