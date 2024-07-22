import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class CustomBoxDecoration extends StatelessWidget {
  final String title;
  final String description;
  final String date;

  const CustomBoxDecoration({
    Key? key,
    required this.title,
    required this.description,
    required this.date,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(
          child: Container(
            width: 88.w,
            height: 21.h,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Color.fromRGBO(237, 255, 251, 1),
                  Color.fromRGBO(255, 235, 244, 1),
                ],
              ),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(top: 3.h),
                      child: Image.asset(
                        'assets/images/Rectangle 351 (1).png',
                        height: 25.sp,
                        alignment: Alignment.topLeft,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 2.5.h, left: 10.sp),
                      child: Text(
                        title,
                        style: TextStyle(
                            fontSize: 14.sp, fontWeight: FontWeight.w600),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: EdgeInsets.only(left: 10.sp, right: 1.sp),
                  child: Text(
                    description,
                    style: TextStyle(
                        color: Color.fromRGBO(152, 152, 152, 1),
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w400),
                  ),
                ),
                Padding(
                  padding:
                      EdgeInsets.only(right: 140.sp, bottom: 4.sp, top: 6.sp),
                  child: Text(
                    'Submission date',
                    style: TextStyle(
                      color: Color.fromRGBO(152, 152, 152, 1),
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w400,
                    ),
                    textAlign: TextAlign.left,
                  ),
                ),
                Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: 10.sp),
                      child: Icon(
                        Icons.calendar_month,
                        color: Color.fromRGBO(2, 183, 199, 1),
                      ),
                    ),
                    Text(
                      date,
                      style: TextStyle(
                          color: Color.fromRGBO(2, 183, 199, 1),
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class CustomBoxDecoration1 extends StatelessWidget {
  final String title;
  final String description;
  bool dialog;
  Widget? pageroute;
  Widget? dialogbox;

  CustomBoxDecoration1(
      {Key? key,
      required this.title,
      this.dialog = false,
      this.dialogbox,
      required this.description,
      this.pageroute})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 2.h),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: GestureDetector(
              onTap: () {
                if (dialog) {
                  showDialog(
                      context: context,
                      builder: (context) => dialogbox ?? Container());
                } else
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => pageroute ?? Container()));
              },
              child: Container(
                width: 85.w,
                height: 8.h,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Color.fromRGBO(255, 250, 243, 1),
                      Color.fromRGBO(236, 239, 255, 1),
                    ],
                  ),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(top: 1.h, left: 10.sp),
                          child: Text(
                            title,
                            style: TextStyle(
                                fontSize: 12.sp, fontWeight: FontWeight.w600),
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 10.sp, right: 2.sp),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            description,
                            style: TextStyle(
                                color: Color.fromRGBO(42, 183, 199, 1),
                                fontSize: 12.sp,
                                fontWeight: FontWeight.w400),
                          ),
                          Icon(Icons.arrow_forward_ios_sharp)
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                          right: 140.sp, bottom: 4.sp, top: 6.sp),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
