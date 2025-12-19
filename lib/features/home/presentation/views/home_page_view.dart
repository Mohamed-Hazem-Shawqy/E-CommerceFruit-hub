import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_hub_app/core/widgets/persistent_bottom_nav_bar.dart';
import 'package:fruits_hub_app/features/cart/presentation/manager/cart_cubit/cart_cubit_cubit.dart';

class HomePageView extends StatelessWidget {
  const HomePageView({super.key});
  static const routeName = 'home';

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CartCubit(),

      child: const PersistentBottomNavBarWidget(),
    );
  }
}
