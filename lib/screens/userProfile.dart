import 'package:doctor_clone/const.dart';
import 'package:doctor_clone/screens/sign_up_screen.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:page_transition/page_transition.dart';

class Userprofile extends StatelessWidget {
  const Userprofile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: appBarColor,
          title: const Text('Who are you??'),
        ),
        body: Stack(children: [
          Container(
            color: appBarColor,
          ),
          Container(
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(40),
                    topRight: Radius.circular(40)),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 40),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton.icon(
                      onPressed: () => Navigator.push(
                          context,
                          PageTransition(
                              child: const SignUpScreen(),
                              type: PageTransitionType.fade)),
                      label: const Text("Patient"),
                      icon: const Icon(FontAwesomeIcons.person),
                    ),
                    ElevatedButton.icon(
                      onPressed: () => PageTransition(
                          child: const SignUpScreen(), type: PageTransitionType.fade),
                      label: const Text("Doctor"),
                      icon: const Icon(FontAwesomeIcons.userDoctor),
                    ),
                  ],
                ),
              ))
        ]));
  }
}
