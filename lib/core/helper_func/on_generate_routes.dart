import 'package:flutter/material.dart';
import 'package:fruits_hub_app/features/auth/presentation/views/login_view_page.dart';
import 'package:fruits_hub_app/features/auth/presentation/views/sign_up_view_page.dart';
import 'package:fruits_hub_app/features/home/presentation/views/home_page_view.dart';
import 'package:fruits_hub_app/features/home/presentation/views/more_best_seller.dart';
import 'package:fruits_hub_app/features/on_boarding/presentation/views/on_boarding_view.dart';
import 'package:fruits_hub_app/features/splash/presentation/views/splash_view.dart';

Route<dynamic> onGenerateRoute(RouteSettings setting) {
  switch (setting.name) {
    case SplashView.routeName:
      return MaterialPageRoute(builder: (context) => const SplashView());
    case OnBoardingView.routeName:
      return MaterialPageRoute(builder: (context) => const OnBoardingView());
    case LoginViewPage.routeName:
      return MaterialPageRoute(builder: (context) => const LoginViewPage());
    case SignUpViewPage.routeName:
      return MaterialPageRoute(builder: (context) => const SignUpViewPage());
    case HomePageView.routeName:
      return MaterialPageRoute(builder: (context) => const HomePageView());
    case MoreBestSeller.routeName:
      return MaterialPageRoute(builder: (context) => const MoreBestSeller());

    default:
      return MaterialPageRoute(builder: (context) => const LoginViewPage());
  }
}
