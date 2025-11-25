import 'package:flutter/material.dart';
import 'package:fruits_hub_app/features/home/presentation/widgets/custom_bottom_nav_bar.dart';
import 'package:fruits_hub_app/features/home/presentation/widgets/home_page_view_body.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';

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
        CustomNavBarScreen(screen: HomePageViewBody()),
        CustomNavBarScreen(screen: Center(child: Text("Page 2"))),
        CustomNavBarScreen(screen: Center(child: Text("Page 3"))),
        CustomNavBarScreen(screen: Center(child: Text("Page 4"))),
      ],

      itemCount: 4,
    );
  }
}
