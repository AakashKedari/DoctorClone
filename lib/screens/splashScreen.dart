import 'dart:async';
import 'package:doctor_clone/screens/home.dart';
import 'package:doctor_clone/screens/sign_in_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  final FirebaseAuth _auth = FirebaseAuth.instance;
  User? _user;

  @override
  void initState() {
    super.initState();

    Future.delayed(const Duration(seconds: 3), () {
      _auth.authStateChanges().listen((User? user) {
        _user = user;
        if (_user != null && mounted) {
          // User is already logged in, navigate to HomeScreen
          Get.offAll(const HomePage());
        } else {
          // User is not logged in, navigate to LoginScreen
          Get.offAll(const SignInScreen());
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      drawerScrimColor: Colors.white,
      body: Center(
        child: Image.asset('assets/images/doctor.jpg',filterQuality: FilterQuality.high,), // Replace with your image asset
      ),
    );
  }
}