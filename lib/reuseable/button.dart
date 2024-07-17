import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class Button extends StatelessWidget {
  String text;
  Button({required this.text, super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: const Color.fromRGBO(42, 183, 199, 1),
      ),
      height: 7.h,
      width: screenWidth * 0.9,
      child: Center(
        child: Text(
            style: TextStyle(
                color: Colors.white,
                fontSize: 13.sp,
                fontWeight: FontWeight.w600),
            text),
      ),
    );
  }
}
