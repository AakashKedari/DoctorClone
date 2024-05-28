import 'package:doctor_clone/screens/appointmentPage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gap/gap.dart';
import '../const.dart';

class DoctorProfile extends StatefulWidget {
  const DoctorProfile({super.key});

  @override
  State<DoctorProfile> createState() => _DoctorProfileState();
}

class _DoctorProfileState extends State<DoctorProfile> {
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
          'Doctor Profile',
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
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Gap(15),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Icon(Icons.share),
                      Gap(10),
                      Icon(Icons.favorite_outline_sharp),
                      Gap(10)
                    ],
                  ),
                  CircleAvatar(
                    radius: 50,
                    child: Image.asset('assets/images/apple_logo.png'),
                  ),
                  const Text(
                    'Doctor name',
                    style: TextStyle(fontSize: 20),
                  ),
                  const Text('Specializations'),
                  const Gap(10),
                  RatingBar.builder(
                    itemSize: 20,
                    initialRating: 4,
                    minRating: 1,
                    direction: Axis.horizontal,
                    allowHalfRating: true,
                    itemCount: 5,
                    itemPadding: const EdgeInsets.symmetric(horizontal: 4.0),
                    itemBuilder: (context, _) => const Icon(
                      Icons.star,
                      color: Colors.amber,
                      size: 10,
                    ),
                    onRatingUpdate: (rating) {
                      print(rating);
                    },
                  ),
                  const Gap(10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      MaterialButton(
                        color: appBarColor,
                        shape: const StadiumBorder(),
                        onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const AppointmentPage())),
                        child: const Text(
                          "Book an Appointment",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                      IconButton(onPressed: (){}, icon: const Icon(FontAwesomeIcons.video,color: appBarColor,))
                    ],
                  ),
                  Gap(10),
                  const Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'About',
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                    ),
                  ),
                  const Gap(10),
                  const Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                          "Dr. Maya Hartfield is the epitome of dedication and compassion. With a stethoscope draped around her neck like a badge of honor, she walks the hospital corridors with purposeful strides. Dr. Hartfield's hands, skilled and steady, are a source of comfort to her patients, whether she's delivering a newborn or setting a fractured bone....")),
                  ListTile(
                    leading: IconButton(
                      icon: const Icon(FontAwesomeIcons.addressCard),
                      onPressed: () {},
                    ),
                    title: const Text('123 Healing Street, Wellness City, 45678'),
                  ),
                  ListTile(
                    leading: IconButton(
                      icon: const Icon(Icons.phone_in_talk_rounded),
                      color: appBarColor,
                      onPressed: () {},
                    ),
                    title: const Text('+91-123-456-7890'),
                  ),
                ],
              ),
            ))
      ]),
    );
  }
}
