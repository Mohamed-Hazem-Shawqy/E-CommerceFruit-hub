import 'package:flutter/material.dart';
import 'package:fruits_hub_app/features/home/presentation/widgets/best_seller_grid_view.dart';
import 'package:fruits_hub_app/features/home/presentation/widgets/best_seller_header.dart';
import 'package:fruits_hub_app/features/home/presentation/widgets/custom_search_text_filed.dart';
import 'package:fruits_hub_app/features/home/presentation/widgets/offers_featured_items_list.dart';
import 'package:fruits_hub_app/features/home/presentation/widgets/custom_app_bar.dart';

class HomePageViewBody extends StatelessWidget {
  const HomePageViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: appBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Column(
                spacing: 16,
                children: [
                  const SizedBox(height: 16),
                  const CustomSearchTextFiled(),
                  const OffersFeaturedItemsList(),
                  const BestSellerHeader(),
                ],
              ),
            ),
            const SliverToBoxAdapter(child: SizedBox(height: 8)),
      
            const BestSellerGridView(),
          ],
        ),
      ),
    );
  }
}
