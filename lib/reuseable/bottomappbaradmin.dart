import 'package:flutter/animation.dart';
import 'package:flutter/material.dart';
import 'package:teachingapp/components/admin/homepageadmin.dart';
import 'package:teachingapp/components/common/profile/profile.dart';
import 'package:teachingapp/components/common/task/taskprogress.dart';
import 'package:teachingapp/components/homepage.dart';
import 'package:teachingapp/components/tutor1.dart';

class BottomNavBarAdmin extends StatefulWidget {
  final int index;
  const BottomNavBarAdmin({super.key, this.index = 0});
  @override
  _BottomNavBarAdminState createState() =>
      _BottomNavBarAdminState();
}

class _BottomNavBarAdminState extends State<BottomNavBarAdmin> {
  int _currentIndex = 0;
  late PageController _pageController;

  @override
  void initState() {
    super.initState();
    setState(() {
      _currentIndex = widget.index;
    });
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _onPageChanged(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  void _onItemTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  List pages = [
    Homepageadmin(),
    Taskprogress(),
    Profile(),
    Tutor1(title: 'hdh'),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(unselectedItemColor: Colors.grey,
        showUnselectedLabels: true,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: const Color.fromRGBO(57, 204, 221, 1),
        currentIndex: _currentIndex,
        onTap: _onItemTapped,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_rounded),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.task_alt_outlined),
            label: 'Assign Task',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.pie_chart),
            label: 'Progress',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}