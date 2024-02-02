import 'dart:async';

import 'package:flutter/material.dart';
import 'package:zylu_employees_app/presentations/screens/homepage.dart';

class SplashServices {
  splashservices(BuildContext ctx) {
    Timer(const Duration(seconds: 3), () {
      Navigator.of(ctx).pushReplacement(MaterialPageRoute(
        builder: (context) => const HomePage(),
      ));
    });
  }
}
