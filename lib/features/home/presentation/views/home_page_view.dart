import 'package:flutter/material.dart';
import 'package:fruits_hub_app/features/home/presentation/widgets/home_page_view_body.dart';

class HomePageView extends StatelessWidget {
  const HomePageView({super.key});
  static const routeName = 'home';

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(), body: HomePageViewBody());
  }
}
