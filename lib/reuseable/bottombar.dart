import 'package:flutter/material.dart';
import 'package:teachingapp/components/common/profile/profile.dart';
import 'package:teachingapp/components/homepage.dart';

class Bottombar extends StatelessWidget {
  const Bottombar({super.key});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: const [
        BottomNavigationBarItem(
          icon: Icon(
            Icons.home_sharp,
            color: Colors.grey,
          ),
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
      onTap: (index) {
        switch (index) {
          case 0:
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Homepage()),
            );
            break;
          case 1:
            break;
          case 2:
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const Profile()),
            );
            break;
          default:
            break;
        }
      },
    );
  }
}
