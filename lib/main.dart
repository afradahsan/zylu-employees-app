import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:zylu_employees_app/firebase_options.dart';
import 'package:zylu_employees_app/presentations/screens/splashscreen.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        textTheme: TextTheme(
          bodyLarge: TextStyle(fontFamily: GoogleFonts.montserrat().fontFamily, fontSize: 20),
          bodyMedium: TextStyle(fontFamily: GoogleFonts.montserrat().fontFamily, color: const Color.fromRGBO(37, 40, 43, 1)),
          bodySmall: TextStyle(fontFamily: GoogleFonts.montserrat().fontFamily)
        )
      ),
      home: const SplashScreen(),
    );
  }
}