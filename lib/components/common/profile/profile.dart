import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:teachingapp/components/common/login/choice.dart';
import 'package:teachingapp/components/homepage.dart';
import 'package:teachingapp/components/common/profile/help.dart';
import 'package:teachingapp/components/common/profile/profiledetails.dart';
import 'package:teachingapp/components/tutor/kids.dart';
import 'package:teachingapp/reuseable/alertbox.dart';
import 'package:teachingapp/reuseable/bottombar.dart';
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
              CustomBoxDecoration1(
                title: 'My Profile',
                description: 'View Personal Details',
                pageroute: ProfileDetails(),
              ),
              CustomBoxDecoration1(
                title: 'Kids',
                description: 'view all kids',
                pageroute: const Kids(),
              ),
              CustomBoxDecoration1(
                title: 'History',
                description: 'Activity History',
                pageroute: ProfileDetails(),
              ),
              CustomBoxDecoration1(
                title: 'Help',
                description: 'Customer Care',
                pageroute: const Help(),
              ),
              CustomBoxDecoration1(
                title: 'Privacy',
                description: 'Delete Account',
                dialog: true,
                dialogbox: AlertBox(
                  title: 'Delete',
                  icon: CupertinoIcons.delete_simple,
                  onConfirm: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => Choice(
                                redirectPageName: Homepage(),
                                firstName: 'John')));
                  },
                  onCancel: () {},
                ),
              ),
              CustomBoxDecoration1(
                title: 'Account',
                description: 'Logout',
                dialog: true,
                dialogbox: AlertBox(
                  title: 'Logout',
                  icon: CupertinoIcons.delete_simple,
                  onConfirm: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => Choice(
                                redirectPageName: Homepage(),
                                firstName: 'John')));
                  },
                  onCancel: () {},
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: Bottombar());
  }
}
