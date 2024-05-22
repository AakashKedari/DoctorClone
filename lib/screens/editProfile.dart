import 'package:doctor_clone/screens/home.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../const.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({super.key});

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(
              Icons.arrow_back_ios,
              color: Colors.white,
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          title: const Text(
            'Edit Profile',
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
                  topLeft: Radius.circular(40), topRight: Radius.circular(40)),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Flexible(
                    flex: 1,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      height: 120,
                      width: 120,
                      decoration: BoxDecoration(
                        borderRadius: const BorderRadius.all(Radius.circular(20)),
                        border: Border.all(color: Colors.black)
                      ),
                      child:  Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: Image.asset('assets/images/arrow.png',fit: BoxFit.cover,),
                      ),
                    ),
                    const Gap(10),
                    const Text('Username',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
                    const Gap(10),
                    const Text('@angelina',style: TextStyle(fontWeight: FontWeight.w200,fontSize: 15),),

                  ]
                )),
                Flexible(
                    flex: 1,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                        children: [
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Username',style: TextStyle(fontWeight: FontWeight.bold),),
                          Text('Angelina Williams')
                        ],
                      ),
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Your Email',style: TextStyle(fontWeight: FontWeight.bold)),
                          Text('angelina@gmail.com')
                        ],
                      ),
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Reset Password',style: TextStyle(fontWeight: FontWeight.bold)),
                          Icon(Icons.arrow_forward_ios)
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text('Notifications',style: TextStyle(fontWeight: FontWeight.bold)),
                          Switch(value: true, onChanged: (value){})
                        ],
                      ),
                                        ],
                                      ),
                    ))



              ],
            ),
          )
        ]),
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.all(10.0),
          child: SizedBox(
              height: 44,
              width: MediaQuery.of(context).size.width,
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      shape: const StadiumBorder(),
                      backgroundColor: appBarColor,
                      foregroundColor: Colors.white),
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: ((context) => const HomePage())));
                  },
                  child: const Text('Done'))),
        ));
  }
}
