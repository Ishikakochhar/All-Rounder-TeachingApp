import 'package:flutter/material.dart';
import 'package:teachingapp/components/child/profilepagekid.dart';
import 'package:teachingapp/components/common/profile/profile.dart';
import 'package:teachingapp/components/common/task/taskprogress.dart';
import 'package:teachingapp/components/homepage.dart';
import 'package:teachingapp/components/parents/profilepageparent.dart';

class BottomNavBarKids extends StatefulWidget {
  final int index;
  const BottomNavBarKids({super.key, this.index = 0});
  @override
  _BottomNavBarKidsState createState() =>
      _BottomNavBarKidsState();
}

class _BottomNavBarKidsState extends State<BottomNavBarKids> {
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
    ProfilePageKid(),
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