import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:teachingapp/components/common/profile/profile.dart';
import 'package:teachingapp/reuseable/infobox.dart';
import 'package:teachingapp/reuseable/textfield.dart';

class Childprofile extends StatelessWidget {
  String childname;
  String childdob;
  String kidid;
  String parentname;
  String parentemail;
  String parentphone;
  Childprofile({
    this.childname = 'Kenny Amy',
    this.parentemail = 'Ken@gmail.com',
    this.parentname = 'Jane Cooper',
    this.parentphone = '+91 1234567809',
    this.childdob = 'DD/MM/YY',
    this.kidid = 'Ken@Teaching',
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
      ),
      body: Center(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(vertical: 1.h),
              child: CircleAvatar(
                radius: 13.w,
                backgroundColor: Colors.blue,
              ),
            ),
            Infobox(text1: "Kid's Name", text2: childname),
            Infobox(text1: "Date Of Birth", text2: childdob),
            Infobox(
              text1: "Kid's ID",
              text2: kidid,
              copybutton: true,
            ),
            Infobox(text1: "Parent's Name", text2: parentname),
            Infobox(text1: "Parent Email", text2: parentemail),
            Infobox(text1: "Parent's Phone Number", text2: parentphone)
          ],
        ),
      ),
    );
  }
}
