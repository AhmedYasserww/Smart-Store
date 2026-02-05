import 'package:flutter/material.dart';

import '../../../../../../core/utils/app_style.dart';

class DescriptionSection extends StatefulWidget {
  const DescriptionSection({super.key});

  @override
  State<DescriptionSection> createState() => _DescriptionSectionState();
}

class _DescriptionSectionState extends State<DescriptionSection> {
  bool expanded = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
            'Description',
            style: AppStyle.styleSemiBold18
        ),
        const SizedBox(height: 8),
        Text(
          expanded
              ? 'A timeless maxi dress crafted from soft, flowing satin, perfect for evening occasions. Its elegant silhouette hugs the body beautifully.'
              : 'A timeless maxi dress crafted from soft, flowing satin...',
          style: AppStyle.styleGreyRegular14,
        ),
        GestureDetector(
          onTap: () => setState(() => expanded = !expanded),
          child: Text(
              expanded ? 'See less' : 'See more',
              style:AppStyle.styleMedium14.copyWith(color: Color(0xff2861AB))

          ),
        ),
      ],
    );
  }
}