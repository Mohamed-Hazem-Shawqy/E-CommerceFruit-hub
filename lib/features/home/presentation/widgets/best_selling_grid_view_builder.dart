import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_hub_app/core/cubits/products_cubit/products_cubit.dart';
import 'package:fruits_hub_app/core/helper_func/dummy_products.dart';
import 'package:fruits_hub_app/features/home/presentation/widgets/best_seller_grid_view.dart';
import 'package:skeletonizer/skeletonizer.dart';

class BestSellerGridViewBuilder extends StatelessWidget {
  const BestSellerGridViewBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductsCubit, ProductsState>(
      builder: (context, state) {
        if (state is ProductsSuccess) {
          return BestSellerGridView(products: state.productEntity);
        } else if (state is ProductsFailuer) {
          return SliverToBoxAdapter(
            child: Center(child: Text(state.errMessage)),
          );
        } else {
          return Skeletonizer.sliver(
            enabled: true,
            child: BestSellerGridView(products: getListOfDummyProduct()),
          );
        }
      },
    );
  }
}
