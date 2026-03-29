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
          widget.description,
          style: AppStyle.styleGreyRegular14,
          maxLines: expanded ? null : 1,
          overflow: expanded
              ? TextOverflow.visible
              : TextOverflow.ellipsis,
        ),

        const SizedBox(height: 4),
        if (_isLongText(widget.description))
          GestureDetector(
            onTap: () => setState(() => expanded = !expanded),
            child: Text(
              expanded ? 'See less' : 'See more',
              style: AppStyle.styleMedium14.copyWith(
                color: const Color(0xff2861AB),
              ),
            ),
          ),
      ],
    );
  }

  bool _isLongText(String text) {
    return text.length > 50;
  }
}