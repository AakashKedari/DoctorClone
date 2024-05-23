import 'package:doctor_clone/screens/doctorProfile.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:page_transition/page_transition.dart';
import '../const.dart';

class DoctorsTab extends StatefulWidget {
  const DoctorsTab({super.key});

  @override
  State<DoctorsTab> createState() => _DoctorsTabState();
}

class _DoctorsTabState extends State<DoctorsTab>
    with SingleTickerProviderStateMixin {
  late final _tabController = TabController(length: 3, vsync: this);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Gap(30),
              const Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Top Rated Doctors',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                ),
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: TabBar(
                  padding: EdgeInsets.zero,
                  dividerColor: Colors.transparent,
                  isScrollable: false,
                  unselectedLabelColor: Colors.black,
                  indicatorColor: appBarColor,
                  labelColor: appBarColor,
                  controller: _tabController,
                  tabs: const [
                    Tab(
                      child: Text(
                        'Gynecologist',
                        style: TextStyle(fontSize: 11,fontWeight: FontWeight.bold),
                      ),
                    ),
                    Tab(
                        child: Text(
                      'Cardiologist',
                      style: TextStyle(fontSize: 11,fontWeight: FontWeight.bold),
                    )),
                    Tab(
                        child: Text(
                      'Nephrologist',
                      style: TextStyle(fontSize: 11,fontWeight: FontWeight.bold),
                    )),
                  ],
                ),
              ),
              const Gap(10),
              Expanded(
                child: TabBarView(
                  controller: _tabController,
                  children: [
                    ListView.builder(
                        shrinkWrap: true,
                        itemCount: 15,
                        itemBuilder: (context, index) {
                          return InkWell(
                            onTap: () => Navigator.push(
                                context,
                                PageTransition(
                                    child: const DoctorProfile(),
                                    type: PageTransitionType.fade)),
                            child: const ListTile(
                              contentPadding: EdgeInsets.only(left: 5,right: 10),
                                title: Text(
                                  'Doctor Name',
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                                subtitle: Text('Gynacologist'),
                                leading: CircleAvatar(
                                    radius: 30,
                                    backgroundImage:
                                        AssetImage('assets/images/doctor.jpg')),
                                trailing: Column(
                                  children: [
                                    Gap(5),
                                    Icon(
                                      Icons.star,
                                      color: Colors.amber,
                                    ),
                                    Text('4.0')
                                  ],
                                )),
                          );
                        }),
                    ListView.builder(
                        shrinkWrap: true,
                        itemCount: 15,
                        itemBuilder: (context, index) {
                          return const ListTile(
                              contentPadding: EdgeInsets.only(left: 5,right: 10),
                              title: Text('Doctor Name'),
                              subtitle: Text('Cardiologist'),
                              leading: CircleAvatar(
                                  radius: 30,
                                  backgroundImage:
                                      AssetImage('assets/images/doctor.jpg')),
                              trailing: Column(
                                children: [
                                  Gap(5),
                                  Icon(
                                    Icons.star,
                                    color: Colors.amber,
                                  ),
                                  Text('4.0')
                                ],
                              ));
                        }),
                    ListView.builder(
                        shrinkWrap: true,
                        itemCount: 15,
                        itemBuilder: (context, index) {
                          return const ListTile(
                              contentPadding: EdgeInsets.only(left: 5,right: 10),
                              title: Text('Doctor Name'),
                              subtitle: Text('Nephrologist'),
                              leading: CircleAvatar(
                                  radius: 30,
                                  backgroundImage:
                                      AssetImage('assets/images/doctor.jpg')),
                              trailing: Column(
                                children: [
                                  Gap(5),
                                  Icon(
                                    Icons.star,
                                    color: Colors.amber,
                                  ),
                                  Text('4.0')
                                ],
                              ));
                        }),
                  ],
                ),
              ),
            ],
          ),
        ),
      )
    ])
        // Stack(
        //   children: [
        //     Container(color: appBarColor,),
        //     Container(
        //       decoration: const BoxDecoration(
        //         color: Colors.white,
        //         borderRadius: BorderRadius.only(topLeft: Radius.circular(30),topRight: Radius.circular(30)),
        //       ),
        //       child: SizedBox(
        //         width: MediaQuery.of(context).size.width,
        //         child:  Padding(
        //           padding: EdgeInsets.symmetric(horizontal: 15),
        //           child:  Column(
        //             crossAxisAlignment: CrossAxisAlignment.start,
        //             mainAxisSize: MainAxisSize.max,
        //                       children: [
        //                         Gap(10),
        //                         Text('Top Rated Doctors',style: TextStyle(fontSize: 16,fontWeight: FontWeight.w600),),
        //
        //                       ],
        //                     ),
        //
        //
        //           ),
        //       ),
        //       ),
        //
        //   ],
        // ),
        //
        // Stack(
        //   children: [
        //   Container(color: appBarColor,),
        //    Container(
        //    decoration: const BoxDecoration(
        //     color: Colors.white,
        //     borderRadius: BorderRadius.only(topLeft: Radius.circular(30),topRight: Radius.circular(30)),),
        //     child:  Padding(
        //       padding: EdgeInsets.symmetric(horizontal: 15),
        //       child:
        //         Column(
        //           children: [
        //             Gap(10),
        //             Text('Top Rated Doctors'),
        //             // TabBarView(children: children),
        //           ],
        //         ),
        //
        //     ),
        //   )
        //   ],
        // ),
        );
  }
}
