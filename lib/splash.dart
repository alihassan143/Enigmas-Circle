import 'package:enimacircle/main_screen.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Future.delayed(const Duration(seconds: 7), () {
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (ctx) => const MainScreen()),
          (route) => false);
    });
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Image.asset(
          "assets/splash.gif",
          fit: BoxFit.fill,
        ),
      ),
    );
  }
}
