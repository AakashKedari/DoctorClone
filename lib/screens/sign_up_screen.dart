import 'package:doctor_clone/screens/sign_in_screen.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gap/gap.dart';
import 'package:page_transition/page_transition.dart';
import '../const.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            'Sign up',
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
                    const Text(
                      'Sign up with',
                      textAlign: TextAlign.start,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const Gap(10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                            child: MaterialButton(
                              height: 40,
                          onPressed: () {},
                          color: Color(0xff006d77),
                          shape: const StadiumBorder(),
                          child: Icon(FontAwesomeIcons.google,color: Colors.white,),
                        )),
                        const Gap(20),
                        Expanded(
                            child: MaterialButton(
                              height: 40,
                          onPressed: () {},
                          color: Color(0xff14213d),
                          child: Icon(FontAwesomeIcons.facebook,color: Colors.white,),
                          shape: const StadiumBorder(),
                        )),
                      ],
                    ),
                    const Gap(10),
                    const Text('OR',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        )),
                    const Gap(10),
                    SizedBox(
                        height: 40,
                        width: double.infinity,
                        child: MaterialButton(
                          onPressed: () {},
                          color: appBarColor,
                          shape: const StadiumBorder(),
                          child:  const Text('Email',style: TextStyle(color: Colors.white),),
                        )),
                    const Gap(10),
                    Row(
                      children: [
                        const Text('Already Member?'),
                        TextButton(onPressed: () => Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => SignInScreen())), child: const Text('Sign In'))
                      ],
                    )
                  ],
                ),
              ))
        ]));
  }
}
