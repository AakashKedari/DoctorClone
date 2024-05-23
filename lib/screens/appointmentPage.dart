import 'package:doctor_clone/customWidgets/datePickerWidget.dart';
import 'package:doctor_clone/customWidgets/timePickerWidget.dart';
import 'package:doctor_clone/screens/home.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:page_transition/page_transition.dart';
import '../const.dart';
import 'dart:ui' as ui;

class AppointmentPage extends StatefulWidget {
  const AppointmentPage({super.key});

  @override
  State<AppointmentPage> createState() => _AppointmentPageState();
}

class _AppointmentPageState extends State<AppointmentPage> {

  final List<String> days = ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'];
  final List<int> dates = List.generate(31, (index) => index + 1);
  final List<String> months = [
    'Jan',
    'Feb',
    'Mar',
    'Apr',
    'May',
    'Jun',
    'Jul',
    'Aug',
    'Sep',
    'Oct',
    'Nov',
    'Dec'
  ];

  String selectedDay = 'Mon';
  int selectedDate = 1;
  String selectedMonth = 'Jan';

  void showSuccessOverlay(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return BackdropFilter(
          filter: ui.ImageFilter.blur(sigmaX: 6, sigmaY: 6),
          child: AlertDialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            title: const Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(Icons.thumb_up, color: Colors.green, size: 24),
                SizedBox(width: 10),
                Text('Success'),
              ],
            ),
            content: const Text('Your appointment is booked!'),
            actions: [
              TextButton(
                child: const Text('OK'),
                onPressed: () {
                  Navigator.pushReplacement(context, PageTransition(child: HomePage(), type: PageTransitionType.fade));
                },
              ),
            ],
          ),
        );
      },
    );
  }

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
            'Book an Appointment',
            style: TextStyle(color: Colors.white, fontSize: 15),
          ),
          centerTitle: true,
          backgroundColor: appBarColor,
          surfaceTintColor: appBarColor,
        ),
        body: SingleChildScrollView(
          child: Stack(children: [
            Container(
              color: appBarColor,
            ),
            Container(
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(40), topRight: Radius.circular(40)),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Gap(20),
                    ListTile(
                      title: const Text('Doctor Name'),
                      subtitle: const Text('Specialization'),
                      leading: SizedBox(
                          height: 80,
                          width: 80,
                          child: Image.asset('assets/images/apple_logo.png')),
                    ),
                    const Gap(20),
                    const Text(
                      'Appointment For',
                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                    ),
                    const Gap(20),
                    const Row(
                      children: [
                        Text('Patient Name : '),
                        Expanded(
                          child: TextField(),
                        )
                      ],
                    ),
                    const Row(
                      children: [
                        Text('Contact Number : '),
                        Expanded(
                          child: TextField(),
                        )
                      ],
                    ),
                    const Gap(20),
                    const Text(
                      'Who is the Patient?',
                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                    ),
                    const Gap(20),
                    Container(
                      width: 100,
                      height: 120,
                      decoration: BoxDecoration(
                          color: Colors.grey.shade200,
                          borderRadius: BorderRadius.circular(15)),
                      child: const Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Center(
                            child: Icon(
                              Icons.add,
                              size: 40,
                            ),
                          ),
                          Text(
                            'Add',
                            style: TextStyle(color: Colors.black),
                          )
                        ],
                      ),
                    ),
                    const Gap(20),
                    const Text(
                      'Select Appointment Date',
                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                    ),
                    const Gap(20),

                    DatePicker(),
                    const Gap(20),
                    const Text(
                      'Select Appointment Time',
                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                    ),
                    const Gap(20),
                    SizedBox(
                        height: 200,
                        child: TimeSlotSelector()),
                  ],
                ),
              ),
            )
          ]),

        ),
    bottomNavigationBar: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: MaterialButton(
        textColor: Colors.white,
        color: appBarColor,
        shape: const StadiumBorder(),
        onPressed: () => showSuccessOverlay(context),
        child: const Text('Confirm'),
      ),
    ),
    );
  }

}

