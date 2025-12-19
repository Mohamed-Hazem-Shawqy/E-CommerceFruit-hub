import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_hub_app/core/cubits/products_cubit/products_cubit.dart';
import 'package:fruits_hub_app/core/repos/product_repo_decl.dart';
import 'package:fruits_hub_app/core/services/get_it_service.dart';
import 'package:fruits_hub_app/features/cart/presentation/manager/cart_cubit/cart_cubit_cubit.dart';
import 'package:fruits_hub_app/features/cart/presentation/manager/cubit/cart_item_cubit.dart';
import 'package:fruits_hub_app/features/cart/presentation/views/cart_view.dart';
import 'package:fruits_hub_app/features/home/presentation/views/products.dart';
import 'package:fruits_hub_app/features/home/presentation/widgets/custom_bottom_nav_bar.dart';
import 'package:fruits_hub_app/features/home/presentation/widgets/home_page_view_body.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';
import 'package:fruits_hub_app/features/home/presentation/widgets/custom_app_bar.dart';

class PersistentBottomNavBarWidget extends StatefulWidget {
  const PersistentBottomNavBarWidget({super.key});

  @override
  State<PersistentBottomNavBarWidget> createState() =>
      _PersistentBottomNavBarWidgetState();
}

class _PersistentBottomNavBarWidgetState
    extends State<PersistentBottomNavBarWidget> {
  late PersistentTabController controller;

  @override
  void initState() {
    controller = PersistentTabController(initialIndex: 0);

    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return PersistentTabView.custom(
      backgroundColor: Colors.transparent,
      bottomScreenMargin: 0,
      navBarHeight: 65,
      context,
      controller: controller,
      customWidget: CustomBottomNavBar(
        activeIndex: controller.index,
        onTap: (index) {
          controller.jumpToTab(index);

          setState(() {});
        },
      ),
      screens: [
        // شاشة Home
        CustomNavBarScreen(
          screen: BlocProvider(
            create: (context) =>
                ProductsCubit(getit.get<ProductRepoDecl>())
                  ..getBestSellingProducts(),
            child: Scaffold(
              appBar: appBar(),
              body: BlocListener<CartCubit, CartCubitState>(
                listener: (context, state) {
                  // Check if this prints in console!
                  if (state is CartCubitAddedItem) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: const Text('تم اضافه المنتج الى السله'),
                        behavior: SnackBarBehavior.floating,
                        margin: const EdgeInsets.only(
                          bottom: 60,
                          left: 16,
                          right: 16,
                        ),
                        duration: const Duration(seconds: 1),
                      ),
                    );
                  } else if (state is CartCubitRemoveItem) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('تم حذف المنتج من السله'),
                        behavior: SnackBarBehavior.floating,
                        margin: EdgeInsets.only(
                          bottom: 60,
                          left: 16,
                          right: 16,
                        ),
                        duration: Duration(seconds: 1),
                      ),
                    );
                  }
                },
                child: HomePageViewBody(),
              ),
            ),
          ),
        ),

        CustomNavBarScreen(
          screen: BlocProvider(
            create: (context) =>
                ProductsCubit(getit.get<ProductRepoDecl>())..getProducts(),
            child: Products(),
          ),
        ),
        CustomNavBarScreen(
          screen: BlocProvider(
            create: (context) => CartItemCubit(),
            child: const CartView(),
          ),
        ),
        CustomNavBarScreen(screen: Center(child: Text("Page 4"))),
      ],

      itemCount: 4,
    );
  }
}
