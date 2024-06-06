import 'dart:developer';

import 'package:doctor_clone/screens/user/editProfile.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:page_transition/page_transition.dart';
import '../../const.dart';

class ProfileTab extends StatefulWidget {
  const ProfileTab({super.key});

  @override
  State<ProfileTab> createState() => _ProfileTabState();
}

class _ProfileTabState extends State<ProfileTab>
    with AutomaticKeepAliveClientMixin {
  String selectedText = 'My Doctors';

  Future<void> loadImage(String imagePath, BuildContext context) async {
    try {
      await precacheImage(AssetImage(imagePath), context);
      print('Image loaded and cached successfully!');
    } catch (e) {
      print('Failed to load and cache the image: $e');
    }
  }

  @override
  void initState() {
    log('Inint Called');
    super.initState();
    Future.delayed(Duration.zero, () {
      loadImage('assets/images/landscape-doctor.jpg', context);
    });
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
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
                        child: Image.network(FirebaseAuth.instance.currentUser?.photoURL ?? '',fit: BoxFit.cover,),
                      ),
                    ),
                     Expanded(
                        child: Column(
                      children: [
                        Center(
                            child: Text(
                          FirebaseAuth.instance.currentUser?.email ?? 'Username',
                          style: const TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 12),
                        )),
                        Text(FirebaseAuth.instance.currentUser?.displayName ?? '@username')
                      ],
                    ))
                  ],
                ),
                const Gap(20),
                InkWell(
                  onTap: () => Navigator.push(context, PageTransition(child: EditProfile(), type: PageTransitionType.fade)),
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
                const Gap(10),
                const Divider(),
                const Gap(10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    InkWell(
                      onTap: () => setState(() {
                        selectedText = 'My Doctors';
                        print(selectedText);
                      }),
                      child: Column(
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
                    ),
                    InkWell(
                      onTap: () => setState(() {
                        selectedText = 'My Appointments';
                        print(selectedText);
                      }),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            'My Appointments',
                            style: TextStyle(
                                fontWeight: selectedText == 'My Appointments'
                                    ? FontWeight.bold
                                    : FontWeight.normal),
                          ),
                          Text(
                            '10',
                            style: TextStyle(
                                fontWeight: selectedText == 'My Appointments'
                                    ? FontWeight.bold
                                    : FontWeight.normal),
                          )
                        ],
                      ),
                    ),

                  ],
                ),
                const Gap(20),
                if (selectedText == 'My Doctors')
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
                                borderRadius: BorderRadius.circular(10),
                                child: Image.asset(
                                  'assets/images/landscape-doctor.jpg',
                                  fit: BoxFit.contain,
                                ),
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
                      }),
                if (selectedText == 'My Appointments')
                  ListView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: 10,
                      itemBuilder: (context, index) {
                        return Card(
                          surfaceTintColor: Colors.white,
                          color: Colors.white,
                          child: Column(
                            children: [
                              ListTile(
                                leading: ClipRRect(
                                    borderRadius: BorderRadius.circular(10),
                                    child: Image.asset(
                                      'assets/images/doctor.jpg',
                                      fit: BoxFit.cover,
                                    )),
                                title: const Text('Dr. Doctor Name'),
                                subtitle: const Text('Address & Distance'),
                                contentPadding: const EdgeInsets.only(left: 5),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 8.0),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    const Text('Date / Time'),
                                    TextButton(
                                        onPressed: () {},
                                        child: const Text('More...'))
                                  ],
                                ),
                              )
                            ],
                          ),
                        );
                      })
              ],
            ),
          ),
        ),
      )
    ]));
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}
