// ignore_for_file: must_be_immutable

import 'dart:math';

import 'package:dob_input_field/dob_input_field.dart';
import 'package:flutter/material.dart';

import 'package:sizer/sizer.dart';
import 'package:teachingapp/my_flutter_app_icons.dart';

class Temp extends StatelessWidget {
  String emailcall;
  bool ifphone;
  bool ifpassword;
  bool ifname;
  bool ifdob;
  Temp(
      {this.emailcall = 'Phone Number',
      this.ifphone = true,
      this.ifpassword = false,
      this.ifname = false,
      this.ifdob = false,
      super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsets.only(top: 70),
      child: Center(
        child: Container(
          height: 7.h,
          width: screenWidth * 0.9,
          decoration: BoxDecoration(
            border: Border.all(color: Color.fromRGBO(226, 226, 226, 1)),
            borderRadius: BorderRadius.circular(15),
            color: Colors.white,
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 0.3.h),
            child: TextFormField(
              style: TextStyle(fontWeight: FontWeight.bold),
              keyboardType: ifphone
                  ? TextInputType.phone
                  : ifpassword
                      ? TextInputType.visiblePassword
                      : ifname
                          ? TextInputType.name
                          : TextInputType.emailAddress,
              decoration: InputDecoration(
                labelText: emailcall,
                labelStyle: TextStyle(color: Colors.black),
                border: InputBorder.none,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class Dob extends StatelessWidget {
  Dob({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsets.only(top: 70),
      child: Center(
        child: Container(
          height: 7.h,
          width: screenWidth * 0.9,
          decoration: BoxDecoration(
            border: Border.all(color: Color.fromRGBO(226, 226, 226, 1)),
            borderRadius: BorderRadius.circular(15),
            color: Colors.white,
          ),
          child: DOBInputField(
            firstDate: DateTime(1900),
            lastDate: DateTime.now(),
            style: TextStyle(fontWeight: FontWeight.bold),
            showLabel: true,
            autovalidateMode: AutovalidateMode.disabled,
            inputDecoration: InputDecoration(
                contentPadding:
                    EdgeInsets.symmetric(horizontal: 4.w, vertical: 1.h),
                border: InputBorder.none,
                floatingLabelAlignment: FloatingLabelAlignment.start,
                counterText: '',
                floatingLabelStyle: TextStyle(
                    color: Color.fromRGBO(117, 117, 117, 1),
                    fontWeight: FontWeight.w400),
                labelStyle: TextStyle(color: Colors.black)),
            fieldLabelText: "Date Of Birth",
          ),
        ),
      ),
    );
  }
}
