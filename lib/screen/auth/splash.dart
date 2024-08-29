import 'package:burmese_guiter/network/firebase/firebase_provider.dart';
import 'package:burmese_guiter/screen/auth/splash_screen.dart';
import 'package:burmese_guiter/screen/buttonNav/bottonNav.dart';
import 'package:burmese_guiter/uitils/secure_storage.dart';
import 'package:flutter/material.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    super.initState();
    FirebaseProvider().requestPermission();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SecureStorage().getAuthStatus() == null || SecureStorage().getAuthStatus() == ''
          ? const SplashScreen()
          : const BottonNavScreen(),
    );
  }
}


