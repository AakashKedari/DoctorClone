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

class _ProfileTabState extends State<ProfileTab> {
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

                    SizedBox(
                      height: 80,
                      width: 80,
                      child: Image.asset('assets/images/arrow.png'),
                    ),
                    const Expanded(
                        child: Center(
                            child: Text(
                      'Username',
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                    )))
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
                          color: Colors.black,
                        )),
                    child: const Center(
                        child: Text(
                      'Edit Profile',
                      style: TextStyle(fontWeight: FontWeight.w500),
                    )),
                  ),
                ),
                Gap(20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Column(
                      children: [
                        Text('Appointments'),
                        Text('10')
                      ],
                    ),
                    Column(
                      children: [
                        Text('My Doctors'),
                        Text('8')
                      ],
                    ),
                  ],
                ),
                Gap(20),
                GridView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                    itemCount: 6,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2
                    ,childAspectRatio: 0.8), itemBuilder: (context,index){
                  return Container(
                    child: Column(
                      children: [
                        SizedBox(
                            height: 100,
                            child: Image.asset('assets/images/arrow.png',fit: BoxFit.contain,)),
                        Text('Doctor Name'),
                        Text('Specialization')
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
}
