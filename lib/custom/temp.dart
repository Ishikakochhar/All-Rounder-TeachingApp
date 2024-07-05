// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

import 'package:sizer/sizer.dart';
import 'package:teachingapp/my_flutter_app_icons.dart';

class Temp extends StatelessWidget {
  String emailcall;
  Temp({this.emailcall = 'bruh', super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(MyFlutterApp.chatwarning),
      ),
      body: Center(
        child: Container(
          height: 10.h,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: Colors.grey,
          ),
          child: Padding(
            padding: const EdgeInsets.only(top: 10),
            child: Column(
              children: [
                Text(emailcall),
                TextField(
                  decoration: InputDecoration(
                    contentPadding:
                        EdgeInsets.symmetric(horizontal: 3.h, vertical: 1.h),
                    border: InputBorder.none,
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
