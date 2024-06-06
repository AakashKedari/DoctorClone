import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:doctor_clone/screens/doctor/doctor_home.dart';
import 'package:doctor_clone/screens/user/home.dart';
import 'package:doctor_clone/screens/sign_up_screen.dart';
import 'package:doctor_clone/screens/user/userProfile.dart';
import 'package:doctor_clone/services/auth.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import '../const.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            'Sign in',
            style: TextStyle(color: Colors.white),
          ),
          centerTitle: true,
          backgroundColor: appBarColor,
          surfaceTintColor: appBarColor,
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
                padding: const EdgeInsets.symmetric(horizontal: 15.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextField(
                      controller: _emailController,
                      decoration: const InputDecoration(
                          hintText: 'email', border: UnderlineInputBorder()),
                    ),
                    TextField(
                      controller: _passwordController,
                      decoration: const InputDecoration(
                          hintText: 'password', border: UnderlineInputBorder()),
                    ),
                    const Gap(10),
                    Align(
                      alignment: Alignment.centerRight,
                      child: TextButton(
                        onPressed: () {},
                        child: const Text(
                          'Forgot Password?',
                          style: TextStyle(color: appBarColor),
                        ),
                      ),
                    ),
                    const Gap(10),
                    Row(
                      children: [
                        Checkbox(
                          value: true, // or false
                          onChanged: (bool? newValue) {
                            // Handle change in value
                          },
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(
                                2), // Adjust for square appearance
                          ),
                          checkColor: Colors.white, // color of the tick Mark
                          activeColor:
                              appBarColor, // color of the checkbox when it is active
                        ),
                        const Text('Remember me?')
                      ],
                    ),
                    const Gap(10),
                    SizedBox(
                        height: 40,
                        width: double.infinity,
                        child: MaterialButton(
                          onPressed: () async {
                            User? user =
                                await FireAuth.signInUsingEmailPassword(
                                    email: _emailController.text,
                                    password: _passwordController.text,
                                    context: context);

                            DocumentSnapshot doc = await FirebaseFirestore.instance.collection('doctors').doc(user?.uid).get();

                            (user != null && !doc.exists)
                                ? Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                        builder: (_) => const HomePage()))
                                : (user != null && doc.exists) ?  Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (_) =>  DoctorHomePage())) : null;
                          },
                          color: appBarColor,
                          shape: const StadiumBorder(),
                          child: const Text(
                            'Sign In',
                            style: TextStyle(color: Colors.white),
                          ),
                        )),
                    const Gap(10),
                    const Center(
                      child: Text('OR',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          )),
                    ),
                    const Gap(10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                            child: MaterialButton(
                          height: 40,
                          onPressed: () async {
                            try {
                              final GoogleSignIn googleSignIn = GoogleSignIn();
                              final GoogleSignInAccount? googleUser =
                                  await googleSignIn.signIn();
                              print(googleUser);
                              final GoogleSignInAuthentication googleAuth =
                                  await googleUser!.authentication;

                              final AuthCredential credential =
                                  GoogleAuthProvider.credential(
                                accessToken: googleAuth.accessToken,
                                idToken: googleAuth.idToken,
                              );

                              final UserCredential userCredential =
                                  await FirebaseAuth.instance
                                      .signInWithCredential(credential);
                              if (userCredential.user == null) {
                                Get.snackbar(
                                    'Google Sign-In canceled by the user.', '');

                                return; // Exit the function without proceeding further
                              } else {
                                googleUser.clearAuthCache();
                                googleSignIn.signOut();
                                Get.offAll(() => const HomePage());

                                // Check if the user is new or existing
                                // if (userCredential
                                //         .additionalUserInfo?.isNewUser ==
                                //     true) {
                                //
                                // } else {
                                //
                                // }
                              }
                              // });
                            } catch (error) {
                              Get.snackbar(
                                  'Google Sign-In canceled by the user.', '',
                                  snackPosition: SnackPosition.BOTTOM);
                              log('error');
                              log(error.toString());
                            }
                          },
                          color: const Color(0xff006d77),
                          shape: const StadiumBorder(),
                          child: const Icon(
                            FontAwesomeIcons.google,
                            color: Colors.white,
                          ),
                        )),
                        const Gap(20),
                        Expanded(
                            child: MaterialButton(
                          height: 40,
                          onPressed: () {},
                          color: const Color(0xff14213d),
                          shape: const StadiumBorder(),
                          child: const Icon(
                            FontAwesomeIcons.facebook,
                            color: Colors.white,
                          ),
                        )),
                      ],
                    ),
                    Row(
                      children: [
                        const Text('Not a Member?'),
                        TextButton(
                            onPressed: () => Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (_) => const Userprofile())),
                            child: const Text(
                              'Sign up',
                              style: TextStyle(color: appBarColor),
                            ))
                      ],
                    )
                  ],
                ),
              ))
        ]));
  }
}
