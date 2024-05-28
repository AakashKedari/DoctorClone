import 'dart:io';
import 'package:doctor_clone/screens/onBoardingScreen.dart';
import 'package:doctor_clone/screens/sign_in_screen.dart';
import 'package:doctor_clone/screens/splashScreen.dart';
import 'package:doctor_clone/services/imageCache.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:shared_preferences/shared_preferences.dart';
 import 'firebase_options.dart';

/// Flag to check if the user is already onBoarded
bool? onBoarded;

Future<void> main() async {
  CustomImageCache();

   await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
   );

  SharedPreferences _prefs = await SharedPreferences.getInstance();
  onBoarded = _prefs.getBool('onBoardShown');

  Permission.location.request().then((status) {

    status.isGranted ? runApp(const MyApp()) : exit(0);
  });
  // runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
   Widget build(BuildContext context)  {

    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
        textTheme: GoogleFonts.radioCanadaTextTheme()
      ),
      home: onBoarded == null ? const OnBoarding() : const SplashScreen(),
    );
  }
}
