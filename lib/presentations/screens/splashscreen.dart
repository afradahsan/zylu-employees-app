import 'dart:async';

import 'package:flutter/material.dart';
import 'package:zylu_employees_app/presentations/screens/homepage.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    super.initState();
    splashservices();
  }

  splashservices(){
    Timer(const Duration(seconds: 3), () {
      Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => const HomePage(),));
    });
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Color.fromRGBO(211, 242, 106, 1),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CircleAvatar(
            radius: 50,
            backgroundImage: AssetImage('assets/images/zylu_logo.jpg'))
        ],
      ),
    );
  }
}