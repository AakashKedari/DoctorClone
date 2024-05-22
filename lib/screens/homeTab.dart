import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import '../const.dart';

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
                  topLeft: Radius.circular(40),
                  topRight: Radius.circular(40)),
            ),
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Gap(10),
                    const Text(
                      'Story From Doctors',
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                    ),
                    const Gap(10),
                    SizedBox(
                      height: 80,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: 4,
                        itemBuilder: (context, index) {
                          return SizedBox(
                            width: MediaQuery.of(context).size.width / 4,
                            child: const CircleAvatar(
                              radius: 20,
                            ),
                          );
                        },
                      ),
                    ),
                    const Gap(10),
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
                          return Card(
                            child: Column(
                              children: [
                                ListTile(
                                  title: const Text('Doctor Name'),
                                  subtitle: const Text('Gynecologist'),
                                  leading: Image.asset(
                                      height: 50,
                                      'assets/images/blank_doctor.png'),
                                  trailing: const Column(
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
                                Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      const Text("\$300"),
                                      ElevatedButton(
                                          style: ElevatedButton.styleFrom(
                                            backgroundColor: appBarColor,
                                          ),
                                          onPressed: () {},
                                          child: const Text('Book Now',
                                              style: TextStyle(
                                                  color: Colors.white)))
                                    ]),
                                const Gap(10)
                              ],
                            ),
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
