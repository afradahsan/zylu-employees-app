import 'dart:async';

import 'package:flutter/material.dart';
import 'package:zylu_employees_app/data/splash_services.dart';
import 'package:zylu_employees_app/presentations/screens/homepage.dart';
import 'package:zylu_employees_app/utils/colors.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    SplashServices().splashservices(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: lightgreen,
      body: const Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: CircleAvatar(
                radius: 50,
                backgroundImage: AssetImage('assets/images/zylu_logo.jpg')),
          )
        ],
      ),
    );
  }
}
