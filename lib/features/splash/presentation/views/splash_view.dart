import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fruits_hub_app/core/services/shared_pref_singleton.dart';
import 'package:fruits_hub_app/core/utils/app_images.dart';
import 'package:fruits_hub_app/core/utils/constant.dart';
import 'package:fruits_hub_app/features/auth/presentation/views/login_view_page.dart';
import 'package:fruits_hub_app/features/home/presentation/views/home_page_view.dart';
import 'package:fruits_hub_app/features/on_boarding/presentation/views/on_boarding_view.dart';
import 'package:svg_flutter/svg.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});
  static const String routeName = 'splash';

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    navigateTime();
    super.initState();
  }

  void navigateTime() {
    Future.delayed(const Duration(seconds: 3), () {
      final bool isOnBoardingSeenBefore =
          SharedPrefSingleton.getInstance(kIsOnBoardingSeenBefore) ?? false;
      if (!mounted) return;
      if (isOnBoardingSeenBefore) {
        if (FirebaseAuth.instance.currentUser != null) {
          Navigator.pushReplacementNamed(context, HomePageView.routeName);
        } else {
          Navigator.pushReplacementNamed(context, LoginViewPage.routeName);
        }
      } else {
        Navigator.pushReplacementNamed(context, OnBoardingView.routeName);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SizedBox(
            height: MediaQuery.sizeOf(context).height,
            child: SvgPicture.asset(Assets.imagesSplash, fit: BoxFit.fill),
          ),
        ],
      ),
    );
  }
}
