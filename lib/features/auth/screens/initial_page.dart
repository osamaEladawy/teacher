import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:teacher/core/storage/pref_services.dart';
import 'package:teacher/features/auth/screens/login_or_signup.dart';
import 'package:teacher/features/home/screens/home_screen.dart';

class InitialPage extends StatelessWidget {
  const InitialPage({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        if (snapshot.hasData &&
                FirebaseAuth.instance.currentUser!.emailVerified ||
            PrefServices.getData(key: "guest") == true) {
          return const HomeScreen();
        } else {
          return const LoginOrSignUp();
        }
      },
    );
  }
}
