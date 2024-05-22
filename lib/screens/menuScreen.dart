import 'package:doctor_clone/screens/editProfile.dart';
import 'package:doctor_clone/screens/settings.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:page_transition/page_transition.dart';
import '../const.dart';

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
        backgroundColor: appBarColor,
        surfaceTintColor: appBarColor,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios,color: Colors.white,), onPressed: () => Navigator.pop(context) ,
        ),
      ),
      body: Stack(
        children: [
          Container(
            color: appBarColor,
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
                borderRadius: BorderRadius.only(topLeft: Radius.circular(20),bottomLeft: Radius.circular(20)),
                color: Colors.white
              ),
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
                          SizedBox(
                            height: 100,
                            width: 100,
                            child: Image.asset('assets/images/arrow.png'),
                          ),
                          const Gap(10),
                          const Text('Username',style: TextStyle(fontWeight: FontWeight.w500,fontSize: 20,color: Colors.white),),
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


        ],
      ),
    );
    // return Scaffold(
    //     appBar: AppBar(
    //       leading: IconButton(
    //         onPressed: () {
    //           Navigator.pop(context);
    //         },
    //         icon: const Icon(
    //           Icons.close,
    //           color: Colors.white,
    //         ),
    //
    //       ),
    //       title: const Text(
    //         'Menu',
    //         style: TextStyle(color: Colors.white),
    //       ),
    //       centerTitle: true,
    //       backgroundColor: appBarColor,
    //       surfaceTintColor: appBarColor,
    //     ),
    //     body: Stack(children: [
    //       Container(
    //         color: appBarColor,
    //       ),
    //       Container(
    //         width: MediaQuery.of(context).size.width,
    //         height: MediaQuery.of(context).size.height,
    //         decoration: const BoxDecoration(
    //           color: Colors.white,
    //           borderRadius: BorderRadius.only(
    //               topLeft: Radius.circular(30), topRight: Radius.circular(30)),
    //         ),
    //         child: Column(
    //           crossAxisAlignment: CrossAxisAlignment.center,
    //           children: [
    //             Flexible(
    //               flex: 2,
    //               child: Column(
    //                 mainAxisAlignment: MainAxisAlignment.center,
    //                 children: [
    //                   Center(
    //                     child: SizedBox(
    //                       height: 100,
    //                       width: 100,
    //                       child: Image.asset('assets/images/arrow.png'),
    //                     ),
    //                   ),
    //                   const Gap(10),
    //                   const Text('Username',style: TextStyle(fontWeight: FontWeight.w500,fontSize: 20),),
    //                 ],
    //               ),
    //             ),
    //              Flexible(
    //                 flex: 2,
    //                 child: Column(
    //                   crossAxisAlignment: CrossAxisAlignment.start,
    //                   mainAxisAlignment: MainAxisAlignment.start,
    //                   children: [
    //                     TextButton( onPressed: () {
    //                       Navigator.push(context, MaterialPageRoute(builder: (_) => EditProfile()));
    //                     }, child: Text('My Profile'),
    //
    //                     ),
    //
    //                     TextButton( onPressed: () {  }, child: Text('Articles'),),
    //
    //                     TextButton( onPressed: () {  }, child: Text('Notifications'),),
    //
    //                     TextButton( onPressed: () {
    //                       Navigator.push(context, MaterialPageRoute(builder: (_) => SettingsPage()));
    //                     }, child: Text('Settings'),),
    //                   ],
    //                 ))
    //           ],
    //         ),
    //       )
    //     ]));
  }
}
