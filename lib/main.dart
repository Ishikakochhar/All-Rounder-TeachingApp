import 'dart:ui';
import 'package:sizer/sizer.dart';
import 'package:flutter/material.dart';
import 'package:teachingapp/components/login/choice.dart';
import 'package:teachingapp/custom/login.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (context, orientation, deviceType) {
        return const MaterialApp(
            title: 'Flutter Demo',
            debugShowCheckedModeBanner: false,
            home: Choice());
      },
    );
  }
}
