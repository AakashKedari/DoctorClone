import 'package:doctor_clone/screens/home.dart';
import 'package:doctor_clone/screens/sign_up_screen.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gap/gap.dart';
import '../const.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
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
                    const TextField(
                      decoration: InputDecoration(
                        hintText: 'email',
                        border: InputBorder.none
                      ),
                    ),
                    const TextField(
                      decoration: InputDecoration(
                          hintText: 'password',
                        border: InputBorder.none
                      ),
                    ),
                    Gap(10),
                    Align(
                      alignment: Alignment.centerRight,
                      child: TextButton(
                        onPressed: () {  },
                        child: Text('Forgot Password?',style: TextStyle(color: appBarColor),),
                      ),
                    ),
                    Gap(10),
                    Row(children: [
                      Checkbox(
                        value: true, // or false
                        onChanged: (bool? newValue) {
// Handle change in value
                        },
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(2), // Adjust for square appearance
                        ),
                        checkColor: Colors.white, // color of the tick Mark
                        activeColor: appBarColor, // color of the checkbox when it is active
                      ),
                      Text('Remember me?')
                    ],),
                    const Gap(10),
                    SizedBox(
                        height: 40,
                        width: double.infinity,
                        child: MaterialButton(
                          onPressed: () => Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => HomePage())),
                          color: appBarColor,
                          shape: const StadiumBorder(),
                          child:  const Text('Sign In',style: TextStyle(color: Colors.white),),
                        )),
                    const Gap(10),
                    Center(
                      child: const Text('OR',
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
                              onPressed: () {},
                              color: const Color(0xff006d77),
                              shape: const StadiumBorder(),
                              child: const Icon(FontAwesomeIcons.google,color: Colors.white,),
                            )),
                        const Gap(20),
                        Expanded(
                            child: MaterialButton(
                              height: 40,
                              onPressed: () {},
                              color: const Color(0xff14213d),
                              child: const Icon(FontAwesomeIcons.facebook,color: Colors.white,),
                              shape: const StadiumBorder(),
                            )),
                      ],
                    ),

                    Row(
                      children: [
                        const Text('Not a Member?'),
                        TextButton(onPressed: () => Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => const SignUpScreen())), child: const Text('Sign up'))
                      ],
                    )
                  ],
                ),
              ))
        ])
    );
  }
}
