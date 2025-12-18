import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_hub_app/core/cubits/products_cubit/products_cubit.dart';
import 'package:fruits_hub_app/core/helper_func/dummy_products.dart';

import 'package:fruits_hub_app/core/utils/app_text_style.dart';
import 'package:fruits_hub_app/core/widgets/notifcation_widget.dart';
import 'package:fruits_hub_app/features/home/presentation/widgets/custom_search_text_filed.dart';
import 'package:fruits_hub_app/features/home/presentation/widgets/products_body.dart';
import 'package:fruits_hub_app/features/home/presentation/widgets/products_header.dart';
import 'package:skeletonizer/skeletonizer.dart';

class Products extends StatelessWidget {
  const Products({super.key});
  static const routeName = 'bestSeller';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('product'.tr(), style: AppTextStyle.bold19),
        centerTitle: true,
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: const NotifcationWidget(),
          ),
        ],
      ),
      body: ProductsViewBodyBuilder(),
    );
  }
}

class ProductsViewBodyBuilder extends StatelessWidget {
  const ProductsViewBodyBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductsCubit, ProductsState>(
      builder: (context, state) {
        if (state is ProductsSuccess) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: CustomScrollView(
              slivers: [
                SliverToBoxAdapter(
                  child: Column(
                    spacing: 16,
                    children: [
                      const CustomSearchTextFiled(),
                      ProductsHeader(
                        length: context.read<ProductsCubit>().productsLength,
                      ),
                    ],
                  ),
                ),
                ProductsBody(products: state.productEntity),
              ],
            ),
          );
        } else if (state is ProductsFailuer) {
          return Center(child: Text(state.errMessage));
        } else {
          return Skeletonizer(
            enabled: true,
            child: CustomScrollView(
              slivers: [ProductsBody(products: getListOfDummyProduct())],
            ),
          );
        }
      },
    );
  }
}
