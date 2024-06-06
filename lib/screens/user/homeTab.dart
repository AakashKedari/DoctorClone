import 'package:doctor_clone/screens/user/appointmentPage.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:page_transition/page_transition.dart';
import '../../const.dart';

class HomeTab extends StatefulWidget {
  const HomeTab({super.key});

  @override
  State<HomeTab> createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            color: appBarColor,
          ),
          Container(
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(40), topRight: Radius.circular(40)),
            ),
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Gap(20),
                    const Text(
                      'Story From Doctors',
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                    ),
                    const Gap(10),
                    SizedBox(
                      height: 120,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: 4,
                        itemBuilder: (context, index) {
                          return Column(
                            children: [
                              SizedBox(
                                  width: MediaQuery.of(context).size.width / 4,
                                  height: 70,
                                  child: Container(
                                    width: 60,
                                    height: 60,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      border: Border.all(
                                        color:
                                            // Color(0xffC50201),
                                            appBarColor, // Border color
                                        width: 3.0, // Border width
                                      ),
                                    ),
                                    child: const CircleAvatar(
                                      radius: 35.0,
                                      backgroundImage: AssetImage(
                                          'assets/images/doctor.jpg'), // Replace with your image URL
                                    ),
                                  )),
                              const Gap(5),
                              const Text(
                                'Doctor Name',
                                style: TextStyle(fontSize: 10),
                              )
                            ],
                          );
                        },
                      ),
                    ),
                    Divider(),
                    const Text(
                      'Nearby Doctors',
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                    ),
                    const Gap(10),
                    ListView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: 4,
                        itemBuilder: (context, index) {
                          return Stack(
                            children: [
                              Row(mainAxisSize: MainAxisSize.min, children: [
                                const Gap(30),
                                Flexible(
                                  child: Card(
                                    semanticContainer: false,
                                    elevation: 2,
                                    color: Colors.white,
                                    surfaceTintColor: Colors.white,
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        const ListTile(
                                          title: Text('Doctor Name'),
                                          subtitle: Text('Specialization'),
                                          contentPadding: EdgeInsets.only(
                                              left: 50, right: 10),
                                          trailing: Column(
                                            children: [
                                              Gap(5),
                                              Icon(
                                                Icons.star,
                                                color: Colors.amber,
                                              ),
                                              Text('4.0')
                                            ],
                                          ),
                                        ),
                                        // Flexible(
                                        //   fit: FlexFit.loose,
                                        //   child: ListTile(
                                        //     contentPadding: EdgeInsets.only(left: 5,right: 10),
                                        //     title: const Text('Doctor Name'),
                                        //     subtitle: const Text('Gynecologist'),
                                        //     trailing: const Column(
                                        //       children: [
                                        //         Gap(5),
                                        //         Icon(
                                        //           Icons.star,
                                        //           color: Colors.amber,
                                        //         ),
                                        //         Text('4.0')
                                        //       ],
                                        //     ),
                                        //   ),
                                        // ),
                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 20),
                                          child: Row(children: [
                                            Gap(20),
                                            const Text("\$300"),
                                            Expanded(
                                              child: SizedBox(),
                                            ),
                                            Align(
                                              alignment: Alignment.centerRight,
                                              child: ElevatedButton(
                                                  style:
                                                      ElevatedButton.styleFrom(
                                                    backgroundColor:
                                                        appBarColor,
                                                  ),
                                                  onPressed: () {
                                                    Navigator.push(
                                                        context,
                                                        PageTransition(
                                                            child:
                                                                AppointmentPage(),
                                                            type:
                                                                PageTransitionType
                                                                    .fade));
                                                  },
                                                  child: const Text('Book',
                                                      style: TextStyle(
                                                          color:
                                                              Colors.white))),
                                            )
                                          ]),
                                        ),
                                        const Gap(10)
                                      ],
                                    ),
                                  ),
                                ),
                              ]),
                              Positioned(
                                  top: 20,
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(15),
                                    child: Image.asset(
                                      'assets/images/doctor.jpg',
                                      width: 70,
                                      height: 70,
                                    ),
                                  )),
                            ],
                          );
                        })
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
