import 'package:doctor_clone/const.dart';
import 'package:doctor_clone/screens/user/articlesPage.dart';
import 'package:doctor_clone/screens/user/doctorsTab.dart';
import 'package:doctor_clone/screens/user/homeTab.dart';
import 'package:doctor_clone/screens/user/menuScreen.dart';
import 'package:doctor_clone/screens/user/profileTab.dart';
import 'package:doctor_clone/screens/user/searchTab.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gap/gap.dart';
import 'package:page_transition/page_transition.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  int _selectedIndex = 0;

  static const List<Widget> _widgetOptions = <Widget>[
    HomeTab(),
    DoctorsTab(),
    SearchTab(),
    ProfileTab(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      _pageController.jumpToPage(_selectedIndex);
    });
  }

  PageController _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          actions: [
            IconButton(
              onPressed: () => Navigator.push(
                  context,
                  PageTransition(
                      child: const ArticlesPage(),
                      type: PageTransitionType.rightToLeft,
                      duration: const Duration(milliseconds: 500))),
              icon: const Icon(
                Icons.menu_book_rounded,
                color: Colors.white,
              ),
            ),
            const Gap(10),
          ],
          leading: IconButton(
            icon: const Icon(
              Icons.menu,
              color: Colors.white,
            ),
            onPressed: () {
              Navigator.push(
                  context,
                  PageTransition(
                      child: const MenuScreen(),
                      type: PageTransitionType.leftToRight,
                      duration: const Duration(milliseconds: 500)));
            },
          ),
          title: Text(
            _selectedIndex == 0
                ? 'Home'
                : _selectedIndex == 1
                    ? 'Doctors'
                    : _selectedIndex == 2
                        ? 'Search'
                        : 'Profile',
            style: const TextStyle(color: Colors.white, fontSize: 20),
          ),
          centerTitle: true,
          backgroundColor: appBarColor,
          surfaceTintColor: appBarColor,
        ),
        body: PageView(
          physics: const NeverScrollableScrollPhysics(),
          controller: _pageController,
          children: _widgetOptions,
          onPageChanged: (index) {
            setState(() {
              _selectedIndex = index;
            });
          },
        ),
        bottomNavigationBar: Container(
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.vertical(
                top: Radius.circular(30.0), bottom: Radius.circular(30.0)),
            boxShadow: [
              BoxShadow(
                color: Colors.black26,
                blurRadius: 10,
                spreadRadius: 5,
              ),
            ],
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.vertical(
                top: Radius.circular(30.0), bottom: Radius.circular(30.0)),
            child: BottomNavigationBar(
              elevation: 20.0,
              type: BottomNavigationBarType.fixed,
              items: <BottomNavigationBarItem>[
                BottomNavigationBarItem(
                  icon: Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: _selectedIndex == 0
                            ? Colors.red.shade200
                            : Colors.transparent),
                    child: const Icon(CupertinoIcons.home),
                  ),
                  label: 'Home',
                ),
                BottomNavigationBarItem(
                  icon: Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: _selectedIndex == 1
                            ? Colors.red.shade200
                            : Colors.transparent),
                    child: const Icon(FontAwesomeIcons.userDoctor),
                  ),
                  label: 'Doctor',
                ),
                BottomNavigationBarItem(
                  icon: Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: _selectedIndex == 2
                            ? Colors.red.shade200
                            : Colors.transparent),
                    child: const Icon(CupertinoIcons.search),
                  ),
                  label: 'Search',
                ),
                BottomNavigationBarItem(
                  icon: Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: _selectedIndex == 3
                            ? Colors.red.shade200
                            : Colors.transparent),
                    child: const Icon(CupertinoIcons.person),
                  ),
                  label: 'Profile',
                ),
              ],
              showSelectedLabels: false,
              showUnselectedLabels: false,
              currentIndex: _selectedIndex,
              selectedItemColor: Colors.redAccent.shade200,
              onTap: _onItemTapped,
              unselectedItemColor: Colors.black38,
            ),
          ),
        ));
  }
}
