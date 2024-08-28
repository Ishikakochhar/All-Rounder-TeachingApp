import 'package:flutter/material.dart';
import 'package:teachingapp/components/common/profile/profile.dart';
import 'package:teachingapp/components/common/task/taskprogress.dart';
import 'package:teachingapp/components/homepage.dart';
import 'package:teachingapp/components/parents/profilepageparent.dart';

class BottomNavBarParents extends StatefulWidget {
  final int index;
  const BottomNavBarParents({super.key, this.index = 0});
  @override
  _BottomNavBarParentsState createState() =>
      _BottomNavBarParentsState();
}

class _BottomNavBarParentsState extends State<BottomNavBarParents> {
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
    Homepage(),
    Taskprogress(),
    ProfileParents(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: const Color.fromRGBO(57, 204, 221, 1),
        currentIndex: _currentIndex,
        onTap: _onItemTapped,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_sharp),
            label: 'Home',
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