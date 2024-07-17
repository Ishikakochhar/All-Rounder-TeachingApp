import 'dart:async';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:teachingapp/components/homepage.dart';
import 'package:teachingapp/components/common/login/choice.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  Future<void> invokeTimer() async {
    Timer(const Duration(seconds: 3), () async {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String? isLoggedIn = prefs.getString("token");

      if (isLoggedIn == "" || isLoggedIn == null) {
        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(
            builder: (context) => Choice(
              redirectPageName: Homepage(),
              firstName: 'login',
            ),
          ),
          (route) => false,
        );
      } else {
        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(
            builder: (context) =>
                Choice(redirectPageName: Homepage(), firstName: ''),
          ),
          (route) => false,
        );
      }
    });
  }

  @override
  void initState() {
    super.initState();
    invokeTimer();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Color.fromRGBO(222, 238, 254, 1),
              Color.fromRGBO(255, 235, 244, 1),
            ],
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              "assets/images/Logo.png",
              height: 220,
              width: 200,
            ),
          ],
        ),
      ),
    );
  }
}
