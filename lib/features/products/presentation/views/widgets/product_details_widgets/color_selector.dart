import 'package:flutter/material.dart';
import '../../../../../../core/utils/app_style.dart';

class ColorSelector extends StatefulWidget {
  const ColorSelector({
    super.key,
    required this.colors,
    this.onColorSelected,
  });

  final List<String> colors;
  final void Function(String color)? onColorSelected;

  @override
  State<ColorSelector> createState() => _ColorSelectorState();
}

class _ColorSelectorState extends State<ColorSelector> {
  int selectedIndex = 0;

  @override
  void initState() {
    super.initState();
    if (widget.colors.isNotEmpty) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        widget.onColorSelected?.call(widget.colors[0]);
      });
    }
  }

  Color _hexToColor(String hex) {
    final normalized = hex.replaceAll('#', '');
    return Color(int.parse('FF$normalized', radix: 16));
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Choose color', style: AppStyle.styleSemiBold18),
        const SizedBox(width: 32),
        Expanded(
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: List.generate(
                widget.colors.length,
                    (index) {
                  final color = _hexToColor(widget.colors[index]);
                  final isSelected = selectedIndex == index;

                  return GestureDetector(
                    onTap: () {
                      setState(() => selectedIndex = index);
                      widget.onColorSelected?.call(widget.colors[index]);
                    },
                    child: Container(
                      margin: const EdgeInsets.only(right: 8),
                      padding: const EdgeInsets.all(4),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        boxShadow: isSelected
                            ? [
                          BoxShadow(
                            color: color.withOpacity(.7),
                            blurRadius: 8,
                          )
                        ]
                            : null,
                      ),
                      child: CircleAvatar(
                        radius: 12,
                        backgroundColor: color,
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
        ),
      ],
    );
  }
}