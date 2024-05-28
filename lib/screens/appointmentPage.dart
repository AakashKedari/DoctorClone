import 'package:doctor_clone/customWidgets/datePickerWidget.dart';
import 'package:doctor_clone/customWidgets/timePickerWidget.dart';
import 'package:doctor_clone/screens/home.dart';
import 'package:dotted_border/dotted_border.dart';
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
            backgroundColor: Colors.transparent,
            surfaceTintColor: Colors.transparent,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            title:
                Icon(Icons.thumb_up_alt_outlined, color: appBarColor, size: 40),
            // const Row(
            //   mainAxisSize: MainAxisSize.min,
            //   children: [
            //     Icon(Icons.thumb_up, color: Colors.green, size: 40),
            //     SizedBox(width: 10),
            //     Text('Success'),
            //   ],
            // ),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Gap(20),
                Text(
                  'Thank You !',
                  style: TextStyle(color: Colors.white),
                ),
                const Text(
                  'Your appointment is booked!',
                  style: TextStyle(color: Colors.white),
                ),
              ],
            ),
            actions: [
              TextButton(
                style: TextButton.styleFrom(backgroundColor: Colors.white),
                child: const Text(
                  'OK',
                  style: TextStyle(color: appBarColor),
                ),
                onPressed: () {
                  Navigator.pushReplacement(
                      context,
                      PageTransition(
                          child: const HomePage(),
                          type: PageTransitionType.fade));
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
                  DottedBorder(
                    borderType: BorderType.RRect,
                    color: Colors.black,
                    dashPattern: const [
                      8,
                      4
                    ], // 8 is the length of the dash, 4 is the space between dashes
                    strokeWidth: 2,
                    radius: const Radius.circular(15),

                    child: Container(
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
                  SizedBox(height: 200, child: TimeSlotSelector()),
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
