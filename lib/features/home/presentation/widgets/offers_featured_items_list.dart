import 'package:flutter/material.dart';
import 'package:fruits_hub_app/features/home/presentation/widgets/offers_featured_items.dart';

class OffersFeaturedItemsList extends StatelessWidget {
  const OffersFeaturedItemsList({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.sizeOf(context).height / 4.4,
      child: PageView.builder(
        padEnds: false,

        scrollDirection: Axis.horizontal,
        itemCount: 4,

        itemBuilder: (context, index) {
          return const OffersFeaturedItems();
        },
      ),
    );
  }
}
