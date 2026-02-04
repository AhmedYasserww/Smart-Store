import 'package:flutter/material.dart';

import '../../../../../core/widgets/custom_offer_card.dart';
class OfferCardListView extends StatelessWidget {
  const OfferCardListView({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 250,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) => const CustomOfferCard(),
        separatorBuilder: (context, index) => const SizedBox(width: 16),
        itemCount: 10,
      ),
    );
  }
}