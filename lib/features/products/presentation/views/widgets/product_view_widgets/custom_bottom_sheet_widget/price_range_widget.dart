import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../../../../../../core/utils/app_style.dart';
import '../../../../../../../core/widgets/custom_text_field.dart';

class PriceRange extends StatefulWidget {
  const PriceRange({
    super.key,
    this.initialMinPrice,
    this.initialMaxPrice,
    required this.onMinChanged,
    required this.onMaxChanged,
  });

  final int? initialMinPrice;
  final int? initialMaxPrice;
  final ValueChanged<int?> onMinChanged;
  final ValueChanged<int?> onMaxChanged;

  @override
  State<PriceRange> createState() => _PriceRangeState();
}

class _PriceRangeState extends State<PriceRange> {
  int? minPrice;
  int? maxPrice;
  String? error;

  int? _toIntOrNull(String value) {
    final trimmed = value.trim();
    if (trimmed.isEmpty) return null;
    return int.tryParse(trimmed);
  }

  void _validate() {
    if (minPrice != null && maxPrice != null && minPrice! > maxPrice!) {
      error = "Min > Max ";
    } else {
      error = null;
    }
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    minPrice = widget.initialMinPrice;
    maxPrice = widget.initialMaxPrice;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Price Range", style: AppStyle.styleRegular16),
        const SizedBox(height: 16),

        Row(
          children: [
            Expanded(
              child: CustomTextField(
                initialValue: minPrice?.toString(),
                keyboardType: TextInputType.number,
                inputFormatters: [
                  FilteringTextInputFormatter.digitsOnly
                ],
                hintText: "Min Price",
                onChange: (value) {
                  minPrice = _toIntOrNull(value ?? '');
                  widget.onMinChanged(minPrice);
                  _validate();
                },
              ),
            ),

            const SizedBox(width: 16),

            Expanded(
              child: CustomTextField(
                initialValue: maxPrice?.toString(),
                keyboardType: TextInputType.number,
                inputFormatters: [
                  FilteringTextInputFormatter.digitsOnly
                ],
                hintText: "Max Price",
                onChange: (value) {
                  maxPrice = _toIntOrNull(value ?? '');
                  widget.onMaxChanged(maxPrice);
                  _validate();
                },
                validator: (_) => error, // 👈 مهم حتى بدون Form عشان يظهر UI
              ),
            ),
          ],
        ),

        // 👇 عرض الرسالة تحت الاتنين (أفضل UX)
        if (error != null) ...[
          const SizedBox(height: 6),
          Text(
            error!,
            style: TextStyle(
              color: Colors.red,
              fontSize: 11, // 👈 صغيرة زي ما طلبت
            ),
          ),
        ],
      ],
    );
  }
}