import 'package:doctor_clone/screens/doctorProfile.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:page_transition/page_transition.dart';

import '../const.dart';

class DoctorsTab extends StatefulWidget {
  const DoctorsTab({super.key});

  @override
  State<DoctorsTab> createState() => _DoctorsTabState();
}

class _DoctorsTabState extends State<DoctorsTab> with SingleTickerProviderStateMixin {
  late final _tabController = TabController(length: 3, vsync: this);
  @override
  Widget build(BuildContext context) {
    return  Scaffold(

      body: TabBarView(
        controller: _tabController,
        children: [
          Stack(
            children: [
              Container(
                color: appBarColor,
              ),
              Container(
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(topLeft: Radius.circular(40),topRight: Radius.circular(40)),
                ),
                child:  ListView.builder(
                    itemCount: 4,
                    itemBuilder: (context,index){
                      return InkWell(
                        onTap: () => Navigator.push(context, PageTransition(child: DoctorProfile(), type: PageTransitionType.fade)),
                        child: ListTile(
                            title: const Text('Doctor Name'),
                            subtitle: Text('Gynacologist'),
                            leading: Image.asset(
                                height: 50,
                                'assets/images/blank_doctor.png'),
                            trailing: Column(
                              children: [
                                Gap(5),
                                Icon(Icons.star,color: Colors.amber,),
                                Text('4.0')
                              ],
                            )
                        
                        ),
                      );}),
              )

            ],
          ),
          Stack(
            children: [
              Container(
                color: appBarColor,
              ),
              Container(
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(topLeft: Radius.circular(30),topRight: Radius.circular(30)),
                ),
                child:  ListView.builder(
                    itemCount: 4,
                    itemBuilder: (context,index){
                      return ListTile(
                          title: const Text('Doctor Name'),
                          subtitle: Text('Cardiologist'),
                          leading: Image.asset(
                              height: 50,
                              'assets/images/blank_doctor.png'),
                          trailing: Column(
                            children: [
                              Gap(5),
                              Icon(Icons.star,color: Colors.amber,),
                              Text('4.0')
                            ],
                          )

                      );}),
              )

            ],
          ),
          Stack(
            children: [
              Container(
                color: appBarColor,
              ),
              Container(
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(topLeft: Radius.circular(30),topRight: Radius.circular(30)),
                ),
                child:  ListView.builder(
                    itemCount: 4,
                    itemBuilder: (context,index){
                      return ListTile(
                          title: const Text('Doctor Name'),
                          subtitle: Text('Nephrologist'),
                          leading: Image.asset(
                              height: 50,
                              'assets/images/blank_doctor.png'),
                          trailing: Column(
                            children: [
                              Gap(5),
                              Icon(Icons.star,color: Colors.amber,),
                              Text('4.0')
                            ],
                          )

                      );}),
              )

            ],
          ),
        ],
      ),
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
