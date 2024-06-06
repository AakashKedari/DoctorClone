import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:doctor_clone/screens/user/doctorProfile.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:page_transition/page_transition.dart';
import '../../const.dart';

List<String?> specialDoctors = [];

class DoctorsTab extends StatefulWidget {
  const DoctorsTab({super.key});

  @override
  State<DoctorsTab> createState() => _DoctorsTabState();
}

class _DoctorsTabState extends State<DoctorsTab>
    with SingleTickerProviderStateMixin {
  late final _tabController = TabController(length: specializations.length, vsync: this);

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    log('init');
    fetchSpecialists('Physicist');
    // _tabController.
  }
  
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

                  onTap: (index){
                    log(specializations[index]);
                    fetchSpecialists(specializations[index]);
                  },
                  padding: EdgeInsets.zero,
                  dividerColor: Colors.transparent,
                  isScrollable: true,
                  unselectedLabelColor: Colors.black,
                  indicatorColor: appBarColor,
                  labelColor: appBarColor,
                  controller: _tabController,
                  tabs: specializations.map((specialization) {
                    return Tab(
                      child: Text(
                        specialization,
                        style: const TextStyle(fontSize: 11, fontWeight: FontWeight.bold),
                      ),
                    );
                  }).toList(),
                ),
              ),
              const Gap(10),
              Expanded(
                child: TabBarView(
                  physics: NeverScrollableScrollPhysics(),
                  controller: _tabController,
                  children: specializations.map((specialization) {
                    // Create a widget for each specialization
                    return YourSpecializationWidget(specialization: specialization);
                  }).toList(),
                ),
              ),
            ],
          ),
        ),
      )
    ])

        );
  }

  Future<void> fetchSpecialists(String specialist) async {
    try {
      QuerySnapshot querySnapshot = await FirebaseFirestore.instance
          .collection('doctors')
          .get();

      if (querySnapshot.docs.isNotEmpty) {
        specialDoctors.clear();
        log('Documents in the collection:');
        for (var doc in querySnapshot.docs) {
          Map<String, dynamic> data = doc.data() as Map<String, dynamic>; // Cast data to Map<String, dynamic>

          if(data['specialization'] == specialist){
            log(data.toString());
            if(data['name'] == null){
              specialDoctors.add(null);
            }else {
              specialDoctors.add(data['name']);
            }

          }
        }
      } else {
        specialDoctors = [];
        setState(() {

        });

        log('No documents found in the collection.');
      }
      setState(() {

      });
    } catch (e) {
      specialDoctors.clear();
      setState(() {

      });
      log('Error fetching data: $e');
    }
  }
}

class YourSpecializationWidget extends StatelessWidget {
  final String specialization;

  const YourSpecializationWidget({super.key, required this.specialization});

  @override
  Widget build(BuildContext context) {
    // Implement the widget for each specialization
    return specialDoctors.isNotEmpty ?  ListView.builder(
        shrinkWrap: true,
        itemCount: specialDoctors.length,
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () => Navigator.push(
                context,
                PageTransition(
                    child: const DoctorProfile(),
                    type: PageTransitionType.fade)),
            child:  ListTile(
                contentPadding: const EdgeInsets.only(left: 5,right: 10),
                title:  Text(
                  specialDoctors[index] ?? 'Doctor',
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                subtitle: Text(specialization),
                leading: const CircleAvatar(
                    radius: 30,
                    backgroundImage:
                    AssetImage('assets/images/doctor.jpg')),
                trailing: const Column(
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
        }) : const Center(child: Text('No Doctor Found'),);
  }
}
