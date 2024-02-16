import 'package:ayurvedic_centre_patients/view/page/home_page.dart';
import 'package:ayurvedic_centre_patients/view/page/login_page.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    navigateToHomescreen();
    super.initState();
  }

  navigateToHomescreen() async {
    await Future.delayed(const Duration(seconds: 3));
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
      return const LoginPage();
    }));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/iPhone 13 & 14 - 1.png"),
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
