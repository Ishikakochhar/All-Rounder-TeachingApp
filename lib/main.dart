import 'dart:ui';
import 'package:flutter/services.dart';
import 'package:sizer/sizer.dart';
import 'package:flutter/material.dart';
import 'package:teachingapp/components/login/choice.dart';
import 'package:teachingapp/components/profile/help.dart';
import 'package:teachingapp/components/splash.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations(
        [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
    return Sizer(
      builder: (context, orientation, deviceType) {
        return MaterialApp(
            theme: ThemeData(
                scaffoldBackgroundColor: Colors.white,
                appBarTheme: AppBarTheme(color: Colors.transparent)),
            title: 'Flutter Demo',
            color: Colors.white,
            debugShowCheckedModeBanner: false,
            home: Splash());
      },
    );
  }
}
