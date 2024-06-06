import 'package:doctor_clone/services/auth.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import '../../const.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
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
            'Settings',
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
            child:  Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                children: [
                  const Flexible(
                    flex: 2,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Gap(10),
                    Padding(
                      padding: EdgeInsets.only(left: 8.0),
                      child: Text('Profile',style: TextStyle(fontWeight: FontWeight.bold))),
                        ListTile(
                          leading: Icon(Icons.person),
                          title: Text('Edit Profile'),
                          trailing: Icon(Icons.arrow_forward_ios_sharp),
                        ), ListTile(
                          leading: Icon(Icons.email_rounded),
                          title: Text('My Email'),
                          trailing: Icon(Icons.arrow_forward_ios_sharp),

                        ), ListTile(
                          leading: Icon(Icons.lock_clock),
                          title: Text('Reset Password'),
                          trailing: Icon(Icons.arrow_forward_ios_sharp),

                        ), ListTile(
                          leading: Icon(Icons.location_history),
                          title: Text('My Location'),
                          trailing: Icon(Icons.arrow_forward_ios_sharp),

                        ),
                        ListTile(
                          leading: Icon(Icons.notifications_active),
                          title: Text('Notifications'),
                          trailing: Icon(Icons.arrow_forward_ios_sharp),

                        ),
                    
                      ],
                    ),
                  ),
                  Flexible(
                    flex: 1,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.start,

                      children: [
                        const Padding(
                          padding: EdgeInsets.only(left: 8.0),
                          child: Text('Support',style: TextStyle(fontWeight: FontWeight.bold),),
                        ),
                        const ListTile(
                          leading: Icon(Icons.shield_outlined),
                          title: Text('Terms & Conditions'),

                        ), ListTile(
                          onTap: () => FirebaseAuth.instance.signOut(),
                          leading: const Icon(Icons.logout),
                          title: const Text('Log Out',style: TextStyle(color: Colors.red),),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            
            ),
          )
        ]));
  }
}
