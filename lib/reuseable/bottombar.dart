import 'package:flutter/material.dart';
import 'package:teachingapp/components/common/profile/profile.dart';
import 'package:teachingapp/components/homepage.dart';

class BottomNavBarWithPageView extends StatefulWidget {
  final int index;
  const BottomNavBarWithPageView({super.key, this.index = 0});
  @override
  _BottomNavBarWithPageViewState createState() =>
      _BottomNavBarWithPageViewState();
}

class _BottomNavBarWithPageViewState extends State<BottomNavBarWithPageView> {
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
    // Replace this with your Progress page
    Center(child: Text('Progress Page')),
    Profile(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
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

BottomNavigationBar navitem(int currentIndex, BuildContext context) {
  return BottomNavigationBar(
    currentIndex: currentIndex,
    onTap: (index) {
      if (currentIndex != index) {
        Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(
                builder: (_) => BottomNavBarWithPageView(
                      index: index,
                    )),
            (route) => false);
      }
    },
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
  );
}
