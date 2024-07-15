import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import 'package:teachingapp/components/homepage.dart';
import 'package:teachingapp/components/profile/help.dart';
import 'package:teachingapp/components/profile/profiledetails.dart';
import 'package:teachingapp/reuseable/boxcustom.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Profile',
          style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w700),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 2.h,
            ),
            CustomBoxDecoration1(
              title: 'My Profile',
              description: 'View Personal Details',
              pageroute: ProfileDetails(),
            ),
            SizedBox(
              height: 2.h,
            ),
            CustomBoxDecoration1(
              title: 'Kids',
              description: 'view all kids',
              pageroute: Profile(),
            ),
            SizedBox(
              height: 2.h,
            ),
            CustomBoxDecoration1(
              title: 'History',
              description: 'Activity History',
              pageroute: ProfileDetails(),
            ),
            SizedBox(
              height: 2.h,
            ),
            CustomBoxDecoration1(
              title: 'Help',
              description: 'Customer Care',
              pageroute: Help(),
            ),
            SizedBox(
              height: 2.h,
            ),
            CustomBoxDecoration1(
              title: 'Privacy',
              description: 'Delete Account',
              pageroute: ProfileDetails(),
            ),
            SizedBox(
              height: 2.h,
            ),
            CustomBoxDecoration1(
              title: 'Account',
              description: 'Logout',
              pageroute: ProfileDetails(),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
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
                  context, MaterialPageRoute(builder: (context) => Homepage()));
              break;
            case 1:
              break;
            case 2:
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => Profile()));
              break;
          }
        },
      ),
    );
  }
}
