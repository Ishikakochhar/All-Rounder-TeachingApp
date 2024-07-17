import 'package:flutter/material.dart';
import 'package:teachingapp/reuseable/infobox.dart';
import 'package:teachingapp/reuseable/textfield.dart';

// ignore: must_be_immutable
class ProfileDetails extends StatelessWidget {
  String profilename;
  String profileemail;
  String profilephone;
  ProfileDetails(
      {this.profilename = 'Jane Cooper',
      this.profileemail = 'Ken@gmail.com',
      this.profilephone = '+91 1234567809',
      super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
      ),
      body: Center(
        child: Column(
          children: [
            Infobox(
              text1: 'Name',
              text2: profilename,
            ),
            Infobox(text1: 'Email', text2: profileemail),
            Infobox(text1: 'Phone Number', text2: profilephone)
          ],
        ),
      ),
    );
  }
}
