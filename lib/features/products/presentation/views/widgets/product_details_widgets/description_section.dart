import 'package:flutter/material.dart';

import '../../../../../../core/utils/app_style.dart';

class DescriptionSection extends StatefulWidget {
  const DescriptionSection({super.key, required this.description});

  final String description;

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
        Text('Description', style: AppStyle.styleSemiBold18),
        const SizedBox(height: 8),
        Text(
          expanded
              ? widget.description
              : _buildShortDescription(widget.description),
          style: AppStyle.styleGreyRegular14,
        ),
        GestureDetector(
          onTap: () => setState(() => expanded = !expanded),
          child: Text(
            expanded ? 'See less' : 'See more',
            style: AppStyle.styleMedium14.copyWith(color: Color(0xff2861AB)),
          ),
        ),
      ],
    );
  }

  String _buildShortDescription(String text) {
    if (text.length <= 80) {
      return text;
    }
    return '${text.substring(0, 80)}...';
  }
}
