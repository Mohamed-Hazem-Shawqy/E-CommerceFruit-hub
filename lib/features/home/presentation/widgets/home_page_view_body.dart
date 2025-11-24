import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fruits_hub_app/features/auth/presentation/views/login_view_page.dart';

class HomePageViewBody extends StatelessWidget {
  const HomePageViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () async {
        await FirebaseAuth.instance.signOut();
        Navigator.pushReplacementNamed(context, LoginViewPage.routeName);
      },
      icon: Icon(Icons.logout),
    );
  }
}
