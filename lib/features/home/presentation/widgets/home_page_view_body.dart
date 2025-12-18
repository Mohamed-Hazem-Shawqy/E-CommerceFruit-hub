import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_hub_app/core/widgets/app_scaffold_messenger.dart';
import 'package:fruits_hub_app/features/cart/presentation/manager/cart_cubit/cart_cubit_cubit.dart';

import 'package:fruits_hub_app/features/home/presentation/widgets/best_seller_header.dart';
import 'package:fruits_hub_app/features/home/presentation/widgets/best_selling_grid_view_builder.dart';
import 'package:fruits_hub_app/features/home/presentation/widgets/custom_search_text_filed.dart';
import 'package:fruits_hub_app/features/home/presentation/widgets/offers_featured_items_list.dart';
import 'package:fruits_hub_app/features/home/presentation/widgets/custom_app_bar.dart';

class HomePageViewBody extends StatelessWidget {
  const HomePageViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(),
      body:  Padding(
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

              const BestSellerGridViewBuilder(),
              const SliverToBoxAdapter(child: SizedBox(height: 70)),
            ],
          ),
        ),
      
    );
  }
}
