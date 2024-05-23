import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:gap/gap.dart';

import '../const.dart';

class ProfileTab extends StatefulWidget {
  const ProfileTab({super.key});

  @override
  State<ProfileTab> createState() => _ProfileTabState();
}

class _ProfileTabState extends State<ProfileTab>  {
  String selectedText = 'My Doctors';

  Future<void> loadImage(String imagePath, BuildContext context) async {
    try {
// Load asset image example
      await precacheImage(AssetImage(imagePath), context);
      print('Image loaded and cached successfully!');
    } catch (e) {
      print('Failed to load and cache the image: $e');
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(Duration.zero, () {
      loadImage('assets/images/landscape-doctor.jpg', context);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(children: [
      Container(
        color: appBarColor,
      ),
      Container(
        width: MediaQuery.of(context).size.width,
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(40), topRight: Radius.circular(40)),
        ),
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30.0),
            child: Column(
              children: [
                const Gap(20),
                Row(
                  // mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                    const Expanded(
                        child: Column(
                      children: [
                        Center(
                            child: Text(
                          'Username',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 20),
                        )),
                        Text('@username')
                      ],
                    ))
                  ],
                ),
                const Gap(20),
                InkWell(
                  onTap: () {},
                  child: Container(
                    width: double.infinity,
                    height: 40,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(
                          color: appBarColor,
                        )),
                    child: const Center(
                        child: Text(
                      'Edit Profile',
                      style: TextStyle(
                          fontWeight: FontWeight.w500, color: appBarColor),
                    )),
                  ),
                ),
                const Gap(20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    const Column(
                      children: [Text('Appointments'), Text('10')],
                    ),
                    Column(
                      children: [
                        Text(
                          'My Doctors',
                          style: TextStyle(
                              fontWeight: selectedText == 'My Doctors'
                                  ? FontWeight.bold
                                  : FontWeight.normal),
                        ),
                        Text(
                          '8',
                          style: TextStyle(
                              fontWeight: selectedText == 'My Doctors'
                                  ? FontWeight.bold
                                  : FontWeight.normal),
                        )
                      ],
                    ),
                  ],
                ),
                const Gap(20),
                GridView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: 8,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisSpacing: 10,
                            crossAxisCount: 2,
                            childAspectRatio: 0.9),
                    itemBuilder: (context, index) {
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Center(
                            child: ClipRRect(
                              child: Image.asset(
                                'assets/images/landscape-doctor.jpg',
                                fit: BoxFit.contain,
                              ),
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          const Text(
                            'Doctor Name',
                            textAlign: TextAlign.start,
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          const Text('Specialization')
                        ],
                      );
                    })
              ],
            ),
          ),
        ),
      )
    ]));
  }
}
