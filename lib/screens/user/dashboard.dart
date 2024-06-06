// import 'package:doctor_clone/const.dart';
// import 'package:flutter/material.dart';
//
// class DashBoard extends StatefulWidget {
//   const DashBoard({super.key});
//
//   @override
//   State<DashBoard> createState() => _DashBoardState();
// }
//
// class _DashBoardState extends State<DashBoard> {
//
//   bool isExpanded = false;
//   int _selectedIndex = 0;
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Row(
//         children: [
//           NavigationRail(
//             onDestinationSelected: (index){
//               setState(() {
//                 _selectedIndex = index;
//               });
//             },
//             selectedLabelTextStyle: TextStyle(color: Colors.white),
//             extended: isExpanded,
//             unselectedIconTheme: const IconThemeData(
//               color: Colors.black
//             ),
//             backgroundColor: appBarColor,
//               useIndicator: true,
//               destinations: const [
//             NavigationRailDestination(icon: Icon(Icons.home), label: Text("Home")),
//             NavigationRailDestination(icon: Icon(Icons.bar_chart), label: Text("Rapports")),
//
//             NavigationRailDestination(icon: Icon(Icons.person), label: Text("Profile")),
//
//             NavigationRailDestination(icon: Icon(Icons.settings), label: Text("Settings")),
//
//           ], selectedIndex: _selectedIndex),
//           Expanded(child: SingleChildScrollView(child: Column(
//             children: [
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   IconButton(onPressed: (){
//                     setState(() {
//                       isExpanded = !isExpanded;
//                     });
//                   }, icon: Icon(Icons.menu)),
//
//                 ],
//               )
//             ],
//           ),))
//         ],
//       )
//     );
//   }
// }

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:doctor_clone/const.dart';
import 'package:flutter/material.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _fetchDoctorsCount();
    _fetchUsersCount();
  }

  int _doctorsCount = 0;
  int _usersCount = 0 ;

  Future<void> _fetchDoctorsCount() async {
    try {
      QuerySnapshot snapshot = await FirebaseFirestore.instance.collection('doctors').get();
      setState(() {
        _doctorsCount = snapshot.docs.length;

      });
    } catch (e) {
      setState(() {

      });
      print('Failed to get document count: $e');
    }

   }

  Future<void> _fetchUsersCount() async {
    try {
      QuerySnapshot snapshot = await FirebaseFirestore.instance.collection('users').get();
      setState(() {
        _usersCount = snapshot.docs.length;

      });
    } catch (e) {
      setState(() {

      });
      print('Failed to get document count: $e');
    }
  }

  //setting the expansion function for the navigation rail
  bool isExpanded = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          //Let's start by adding the Navigation Rail
          NavigationRail(
              extended: isExpanded,
              backgroundColor: appBarColor,
              unselectedIconTheme:
              const IconThemeData(color: Colors.white, opacity: 1),
              unselectedLabelTextStyle: const TextStyle(
                color: Colors.white,
              ),
              selectedIconTheme:
              IconThemeData(color: Colors.deepPurple.shade900),
              destinations: const [
                NavigationRailDestination(
                  icon: Icon(Icons.home),
                  label: Text("Home"),
                ),
                NavigationRailDestination(
                  icon: Icon(Icons.bar_chart),
                  label: Text("Rapports"),
                ),
                NavigationRailDestination(
                  icon: Icon(Icons.person),
                  label: Text("Profile"),
                ),
                NavigationRailDestination(
                  icon: Icon(Icons.settings),
                  label: Text("Settings"),
                ),
              ],
              selectedIndex: 0),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(60.0),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    //let's add the navigation menu for this project
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconButton(
                          onPressed: () {
                            //let's trigger the navigation expansion
                            setState(() {
                              isExpanded = !isExpanded;
                            });
                          },
                          icon: const Icon(Icons.menu),
                        ),
                        const CircleAvatar(
                          // backgroundImage:
                          // NetworkImage(
                          //     "https://faces-img.xcdn.link/image-lorem-face-3430.jpg"),
                          radius: 26.0,
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    //Now let's start with the dashboard main rapports
                     Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Flexible(
                          child: Card(
                            child: Padding(
                              padding: const EdgeInsets.all(18.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Row(
                                    children: [
                                      Icon(
                                        Icons.medical_services,
                                        size: 26.0,
                                      ),
                                      SizedBox(
                                        width: 15.0,
                                      ),
                                      Text(
                                        "Doctors",
                                        style: TextStyle(
                                          fontSize: 26.0,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      )
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 20.0,
                                  ),
                                  Text(
                                    "Total : $_doctorsCount",
                                    style: const TextStyle(
                                      fontSize: 36,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                         Flexible(
                          child: Card(
                            child: Padding(
                              padding: const EdgeInsets.all(18.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Row(
                                    children: [
                                      Icon(
                                        Icons.comment,
                                        size: 26.0,
                                        color: Colors.red,
                                      ),
                                      SizedBox(
                                        width: 15.0,
                                      ),
                                      Text(
                                        "Users",
                                        style: TextStyle(
                                          color: Colors.red,
                                          fontSize: 26.0,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      )
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 20.0,
                                  ),
                                  Text(
                                    "Total : ${_usersCount}",
                                    style: const TextStyle(
                                      color: Colors.red,
                                      fontSize: 36,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                        const Flexible(
                          child: Card(
                            child: Padding(
                              padding: EdgeInsets.all(18.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Icon(
                                        Icons.people,
                                        size: 26.0,
                                        color: Colors.amber,
                                      ),
                                      SizedBox(
                                        width: 15.0,
                                      ),
                                      Flexible(
                                        child: Text(
                                          "Appointments",
                                          style: TextStyle(
                                            fontSize: 26.0,
                                            color: Colors.amber,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                  SizedBox(
                                    height: 20.0,
                                  ),
                                  Text(
                                    "3.2K",
                                    style: TextStyle(
                                      fontSize: 36,
                                      color: Colors.amber,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                        const Flexible(
                          child: Card(
                            child: Padding(
                              padding: EdgeInsets.all(18.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Icon(
                                        Icons.monetization_on_outlined,
                                        size: 26.0,
                                        color: Colors.green,
                                      ),
                                      SizedBox(
                                        width: 15.0,
                                      ),
                                      Text(
                                        "Revenue",
                                        style: TextStyle(
                                          fontSize: 26.0,
                                          color: Colors.green,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      )
                                    ],
                                  ),
                                  SizedBox(
                                    height: 20.0,
                                  ),
                                  Text(
                                    "₹ 2300",
                                    style: TextStyle(
                                      fontSize: 36,
                                      color: Colors.green,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    //Now let's set the article section
                    const SizedBox(
                      height: 30.0,
                    ),
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          children: [
                            Text(
                              "6 Articles",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 28.0,
                              ),
                            ),
                            SizedBox(
                              height: 10.0,
                            ),
                            Text(
                              "3 new Articles",
                              style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 18.0,
                                  fontWeight: FontWeight.w400),
                            ),
                          ],
                        ),
                        SizedBox(
                          width: 300.0,
                          child: TextField(
                            decoration: InputDecoration(
                              hintText: "Type Article Title",
                              prefixIcon: Icon(Icons.search),
                              border: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Colors.black26,
                                ),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 40.0,
                    ),

                    //let's set the filter section
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        TextButton.icon(
                          onPressed: () {},
                          icon: Icon(
                            Icons.arrow_back,
                            color: Colors.deepPurple.shade400,
                          ),
                          label: const Text(
                            "2024",
                            style: TextStyle(
                              color: appBarColor,
                            ),
                          ),
                        ),
                        Row(
                          children: [
                            DropdownButton(
                                hint: const Text("Filter by"),
                                items: const [
                                  DropdownMenuItem(
                                    value: "Date",
                                    child: Text("Date"),
                                  ),
                                  DropdownMenuItem(
                                    value: "Comments",
                                    child: Text("Comments"),
                                  ),
                                  DropdownMenuItem(
                                    value: "Views",
                                    child: Text("Views"),
                                  ),
                                ],
                                onChanged: (value) {}),
                            const SizedBox(
                              width: 20.0,
                            ),
                            DropdownButton(
                                hint: const Text("Order by"),
                                items: const [
                                  DropdownMenuItem(
                                    value: "Date",
                                    child: Text("Date"),
                                  ),
                                  DropdownMenuItem(
                                    value: "Comments",
                                    child: Text("Comments"),
                                  ),
                                  DropdownMenuItem(
                                    value: "Views",
                                    child: Text("Views"),
                                  ),
                                ],
                                onChanged: (value) {}),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 40.0,
                    ),
                    //Now let's add the Table
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        DataTable(
                            headingRowColor: WidgetStateProperty.resolveWith(
                                    (states) => Colors.grey.shade200),
                            columns: const [
                              DataColumn(label: Text("ID")),
                              DataColumn(label: Text("Article Title")),
                              DataColumn(label: Text("Creation Date")),
                              DataColumn(label: Text("Views")),
                              DataColumn(label: Text("Comments")),
                            ],
                            rows: [
                              DataRow(cells: [
                                const DataCell(Text("0")),
                                const DataCell(
                                    Text("How to build a Flutter Web App")),
                                DataCell(Text("${DateTime.now()}")),
                                const DataCell(Text("2.3K Views")),
                                const DataCell(Text("102 Comments")),
                              ]),
                              DataRow(cells: [
                                const DataCell(Text("1")),
                                const DataCell(
                                    Text("How to build a Flutter Mobile App")),
                                DataCell(Text("${DateTime.now()}")),
                                const DataCell(Text("21.3K Views")),
                                const DataCell(Text("1020 Comments")),
                              ]),
                              DataRow(cells: [
                                const DataCell(Text("2")),
                                const DataCell(
                                    Text("Flutter for your first project")),
                                DataCell(Text("${DateTime.now()}")),
                                const DataCell(Text("2.3M Views")),
                                const DataCell(Text("10K Comments")),
                              ]),
                            ]),
                        //Now let's set the pagination
                        const SizedBox(
                          height: 40.0,
                        ),
                        Row(
                          children: [
                            TextButton(
                              onPressed: () {},
                              child: const Text(
                                "1",
                                style: TextStyle(color: Colors.deepPurple),
                              ),
                            ),
                            TextButton(
                              onPressed: () {},
                              child: const Text(
                                "2",
                                style: TextStyle(color: Colors.deepPurple),
                              ),
                            ),
                            TextButton(
                              onPressed: () {},
                              child: const Text(
                                "3",
                                style: TextStyle(color: Colors.deepPurple),
                              ),
                            ),
                            TextButton(
                              onPressed: () {},
                              child: const Text(
                                "See All",
                                style: TextStyle(color: Colors.deepPurple),
                              ),
                            ),
                          ],
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
      //let's add the floating action button
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: appBarColor,
        child: const Icon(Icons.add,color: Colors.white,),
      ),
    );
  }
}