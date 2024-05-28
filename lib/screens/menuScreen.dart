import 'package:doctor_clone/customWidgets/menuIcon.dart';
import 'package:doctor_clone/screens/articlesPage.dart';
import 'package:doctor_clone/screens/home.dart';
import 'package:doctor_clone/screens/settings.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gap/gap.dart';
import 'package:page_transition/page_transition.dart';
import '../const.dart';
import 'editProfile.dart';

class MenuScreen extends StatefulWidget {
  const MenuScreen({super.key});

  @override
  State<MenuScreen> createState() => _MenuScreenState();
}

class _MenuScreenState extends State<MenuScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red.shade300,
        surfaceTintColor: Colors.red.shade300,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios,color: Colors.white,), onPressed: () => Navigator.pop(context) ,
        ),
      ),
      body: Stack(
        children: [
          Container(
            color: Colors.red.shade300,
          ),
          Positioned(
            right: 0,
            top: 20,
            left: MediaQuery.of(context).size.width * 0.55,bottom:  MediaQuery.of(context).size.height * 0.12,
            child: Container(
              decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(topLeft: Radius.circular(20),bottomLeft: Radius.circular(20)),
                  color: Colors.tealAccent
              ),
            ),

          ),
          Positioned(
            right: 0,
            top: 0,
            left: MediaQuery.of(context).size.width * 0.6,bottom:  MediaQuery.of(context).size.height * 0.1,
            child: Container(
              decoration: const BoxDecoration(
                // image: DecorationImage(image: AssetImage('assets/images/stethescope1.jpg')),
                  borderRadius: BorderRadius.only(topLeft: Radius.circular(20),bottomLeft: Radius.circular(20)),
                  color: Colors.white
              ),
            child: ClipRRect(
                borderRadius: BorderRadius.only(topLeft: Radius.circular(20),bottomLeft: Radius.circular(20)),

                child: Image.asset('assets/images/stethescope1.jpg',fit: BoxFit.cover,)),
            ),

          ),
          Positioned(
            left: 20,
            right: 0,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Gap(40),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        border: Border.all(color: appBarColor),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      height: 80,
                      width: 80,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(15),

                        child: Image.asset('assets/images/doctor.jpg'),
                      ),
                    ),
                    const Gap(10),
                     Text(FirebaseAuth.instance.currentUser?.displayName ?? 'Username',style: TextStyle(fontWeight: FontWeight.w500,fontSize: 20,color: Colors.white),),
                    Gap(MediaQuery.of(context).size.height * 0.12),
                    TextButton( onPressed: () {
                      Navigator.push(context, PageTransition(child: const EditProfile(), type: PageTransitionType.fade,duration: Duration(milliseconds: 500)));
                    }, child: const Text('My Profile',style: TextStyle(color: Colors.white)),

                    ),

                    TextButton( onPressed: () {  }, child: const Text('Articles',style: TextStyle(color: Colors.white),),),

                    TextButton( onPressed: () {  }, child: const Text('Notifications',style: TextStyle(color: Colors.white)),),

                    TextButton( onPressed: () {
                      Navigator.push(context, PageTransition(child: const SettingsPage(), type: PageTransitionType.fade,duration: Duration(milliseconds: 500)));
                    }, child: const Text('Settings',style: TextStyle(color: Colors.white)),),
                  ],
                )
              ],
            ),
          ),
      // appBar: AppBar(
      //   backgroundColor: Colors.transparent,
      //   surfaceTintColor: Colors.transparent,
      //   leading: IconButton(
      //     icon: const Icon(Icons.arrow_back_ios,color: Colors.white,), onPressed: () => Navigator.pop(context) ,
      //   ),
      // ),
      // body: Stack(
      //   children: [
      //     Container(
      //       decoration:  const BoxDecoration(
      //         gradient:  LinearGradient(
      //   begin: Alignment.topRight,
      //   end: Alignment.bottomLeft,
      //   // stops: [0.1, 0.5, 0.7, 0.9],
      //   colors: [
      //    appBarColor,
      //     Colors.tealAccent
      //   ],
      //       ),),
      //       // color: appBarColor,
      //     ),
      //     // Positioned(
      //     //   right: 0,
      //     //   top: 20,
      //     //   left: MediaQuery.of(context).size.width * 0.55,bottom:  MediaQuery.of(context).size.height * 0.12,
      //     //   child: Container(
      //     //     decoration: const BoxDecoration(
      //     //         borderRadius: BorderRadius.only(topLeft: Radius.circular(20),bottomLeft: Radius.circular(20)),
      //     //         color: Colors.tealAccent
      //     //     ),
      //     //   ),
      //     // ),
      //     // Positioned(
      //     //   right: 0,
      //     //   top: 0,
      //     //   left: MediaQuery.of(context).size.width * 0.6,bottom:  MediaQuery.of(context).size.height * 0.1,
      //     //   child: Container(
      //     //     decoration: const BoxDecoration(
      //     //       borderRadius: BorderRadius.only(topLeft: Radius.circular(20),bottomLeft: Radius.circular(20)),
      //     //       color: Colors.white
      //     //     ),
      //     //   ),
      //     // ),
      // // const Gap(40),
      // Column(
      //   // mainAxisSize: MainAxisSize.min,
      //   mainAxisAlignment: MainAxisAlignment.center,
      //   crossAxisAlignment: CrossAxisAlignment.center,
      //   children: [
      //     Row(
      //       mainAxisAlignment: MainAxisAlignment.center,
      //       children: [
      //
      //         Container(
      //           decoration: BoxDecoration(
      //             border: Border.all(color: appBarColor),
      //             borderRadius: BorderRadius.circular(15),
      //           ),
      //           height: 80,
      //           width: 80,
      //           child: ClipRRect(
      //             borderRadius: BorderRadius.circular(15),
      //
      //             child: Image.asset('assets/images/doctor.jpg'),
      //           ),
      //         ),
      //       ],
      //     ),
      //     const Gap(10),
      //     const Row(
      //       mainAxisAlignment: MainAxisAlignment.center,
      //       children: [
      //         Gap(10),
      //         Text('Username',style: TextStyle(fontWeight: FontWeight.w500,fontSize: 20,color: Colors.white),),
      //       ],
      //     ),
      //     Gap(MediaQuery.of(context).size.height * 0.12),
      //    Align(
      //        alignment: Alignment.center,
      //        child: MenuIconName(icon: const Icon(FontAwesomeIcons.person,color: Colors.white,), optionName: 'My Profile', toNavigate: const HomePage())),
      //     Align(
      //         alignment: Alignment.center,
      //         child: MenuIconName(icon: const Icon(FontAwesomeIcons.newspaper,color: Colors.white,), optionName: 'Articles', toNavigate: const ArticlesPage())),
      //     Align(
      //         alignment: Alignment.center,
      //         child: MenuIconName(icon: const Icon(FontAwesomeIcons.bell,color: Colors.white,), optionName: 'Notifications', toNavigate: null)),
      //      Align(
      //          alignment: Alignment.center,
      //          child: MenuIconName(icon: const Icon(CupertinoIcons.settings,color: Colors.white,), optionName: 'Settings', toNavigate: const SettingsPage())),
      //     Align(
      //         alignment: Alignment.center,
      //         child: MenuIconName(icon: const Icon(Icons.headset_mic_outlined,color: Colors.white,), optionName: 'Support', toNavigate: null))
      //
      //    ],
      //  ),
      //

        ],
      ),
    );

  }
}
