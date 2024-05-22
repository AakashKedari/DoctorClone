import 'package:flutter/material.dart';
import '../const.dart';

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
          title: Text(
            'Settings',
            style: const TextStyle(color: Colors.white),
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
            child: const Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                children: [
                  Flexible(
                    flex: 2,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Profile',style: TextStyle(fontWeight: FontWeight.bold)),
                        ListTile(
                          leading: Icon(Icons.person),
                          title: Text('Edit Profile'),
                        ), ListTile(
                          leading: Icon(Icons.email_rounded),
                          title: Text('My Email'),
                        ), ListTile(
                          leading: Icon(Icons.lock_clock),
                          title: Text('Reset Password'),
                        ), ListTile(
                          leading: Icon(Icons.location_history),
                          title: Text('My Location'),
                        ),
                        ListTile(
                          leading: Icon(Icons.notifications_active),
                          title: Text('Notifications'),
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
                        Text('Support',style: TextStyle(fontWeight: FontWeight.bold),),
                        ListTile(
                          leading: Icon(Icons.shield_outlined),
                          title: Text('Terms & Conditions'),
                        ), ListTile(
                          leading: Icon(Icons.logout),
                          title: Text('Log Out',style: TextStyle(color: Colors.red),),
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
