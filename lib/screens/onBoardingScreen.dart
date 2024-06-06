import 'package:doctor_clone/const.dart';
import 'package:doctor_clone/screens/user/home.dart';
import 'package:doctor_clone/screens/sign_in_screen.dart';
import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class OnBoarding extends StatefulWidget {
  const OnBoarding({super.key});

  @override
  State<OnBoarding> createState() => _OnBoardingState();
}

class _OnBoardingState extends State<OnBoarding> {

  List<PageViewModel> getPages = [
    PageViewModel(
      decoration: const PageDecoration(),
      titleWidget: Container(
        height: 250,
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/images/apple_logo.png'))),
      ),
      // title: 'Welcome',

      bodyWidget: const Column(
        children: [
          Text(
            'Intro',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
          ),
          Text(
            "At [App Name], we believe that quality healthcare should be accessible anytime, anywhere. Our platform connects you with medical professionals ready to assist you with your health concerns.",
            textAlign: TextAlign.center,
          )
        ],
      ),
    ),
    PageViewModel(
        decoration: const PageDecoration(imageFlex: 2, bodyFlex: 2),
        titleWidget: const Column(
          children: [
            Text(
              'Welcome',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
            ),
            Text(
              "At [App Name], we believe that quality healthcare should be accessible anytime, anywhere. Our platform connects you with medical professionals ready to assist you with your health concerns.",
              textAlign: TextAlign.center,
            )
          ],
        ),
        // title: 'Welcome',
        bodyWidget: Container(
          height: 250,
          decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/images/doctor.jpg'))),
        )),
    PageViewModel(
      decoration: const PageDecoration(imageFlex: 2, bodyFlex: 2),
      titleWidget: const Column(
        children: [
          Text(
            'Welcome',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
          ),
          Text(
            "At [App Name], we believe that quality healthcare should be accessible anytime, anywhere. Our platform connects you with medical professionals ready to assist you with your health concerns.",
            textAlign: TextAlign.center,
          )
        ],
      ),
      // title: 'Welcome',
      bodyWidget: Container(
        height: 250,
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/images/doctor.jpg'))),
      ),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: appBarColor,
          surfaceTintColor: appBarColor,
        ),
        body: Stack(children: [
          Container(
            color: appBarColor,
          ),
          Container(
              width: MediaQuery.of(context).size.width,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(40),
                    topRight: Radius.circular(40)),
              ),
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: IntroductionScreen(
                  dotsDecorator: DotsDecorator(
                    activeColor: Colors.red.shade300
                  ),
                  back: const Text('Back'),
                  skipStyle: ButtonStyle(

                    backgroundColor:
                        MaterialStateProperty.all<Color>(Colors.red.shade200),
                    shape: MaterialStateProperty.all<OutlinedBorder>(
                        const RoundedRectangleBorder()),
                  ),
                  skip: const Text('Skip',style: TextStyle(color: Colors.black),),

                  onSkip: () async {
                    SharedPreferences _prefs =
                        await SharedPreferences.getInstance();
                    _prefs.setBool('onBoardShown', true);
                    Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (_) => const SignInScreen()));
                  },
                  showBackButton: false,
                  showSkipButton: true,
                  overrideBack: const Text('Next'),
                  globalHeader: Container(
                    color: appBarColor,
                  ),
                  pages: getPages,
                  onDone: () async {
                    SharedPreferences _prefs =
                        await SharedPreferences.getInstance();
                    _prefs.setBool('onBoardShown', true);
                    Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (_) => const SignInScreen()));
                  },
                  done: SizedBox(
                      width: MediaQuery.of(context).size.width * 0.5,
                      child: const Center(child: Text('Done',style: TextStyle(color: Colors.black),))),
                  doneStyle: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all<Color>(Colors.red.shade200),
                    shape: MaterialStateProperty.all<OutlinedBorder>(
                      const StadiumBorder(),
                    ),
                  ),
                  next: const Text('Next'),
                  showNextButton: false,
                ),
              ))
        ]));
  }
}
