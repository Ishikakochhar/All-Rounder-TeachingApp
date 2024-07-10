// ignore_for_file: prefer_const_constructors

import 'package:dob_input_field/dob_input_field.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:teachingapp/reuseable/button.dart';
import 'package:teachingapp/reuseable/temp.dart';

class CustomLogin extends StatefulWidget {
  CustomLogin({super.key});

  @override
  State<CustomLogin> createState() => _CustomLoginState();
}

class _CustomLoginState extends State<CustomLogin>
    with TickerProviderStateMixin {
  bool switchcust = false;
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: Text('Parent Login'),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(
              stops: [0, 0.9],
              colors: [
                Color.fromRGBO(255, 250, 243, 1),
                Color.fromRGBO(236, 239, 255, 1)
              ],
            )),
          ),
          Padding(
            padding: EdgeInsets.only(top: 15.h),
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 8.w, right: 8.w),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(17),
                      color: Color.fromRGBO(255, 255, 255, 0.32),
                    ),
                    padding:
                        EdgeInsets.symmetric(horizontal: 1.w, vertical: 0.5.h),
                    child: TabBar(
                      controller: _tabController,
                      labelColor: Colors.white,
                      labelStyle: TextStyle(
                          fontSize: 13.sp, fontWeight: FontWeight.w600),
                      dividerColor: Colors.transparent,
                      indicatorSize: TabBarIndicatorSize.tab,
                      isScrollable: false,
                      indicator: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: Color.fromRGBO(42, 183, 199, 1)),
                      tabs: [
                        Tab(
                          text: 'Phone Number',
                        ),
                        Tab(
                          text: 'Email Id',
                        )
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: TabBarView(
                    physics: NeverScrollableScrollPhysics(),
                    controller: _tabController,
                    children: [
                      Padding(
                        padding:
                            EdgeInsets.only(top: 1.h, right: 2.h, left: 2.h),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Temp(
                              hinttext: 'Phone Number',
                              ifphone: true,
                            ),
                            Temp(
                              ifpassword: true,
                              hinttext: 'Password',
                            ),
                            SizedBox(
                              height: 1.h,
                            ),
                            Align(
                              alignment: Alignment.centerRight,
                              child: Text(
                                'Forgot Password?',
                                style: TextStyle(
                                    fontSize: 11.sp,
                                    color: Color.fromRGBO(42, 183, 199, 1),
                                    fontWeight: FontWeight.w600),
                              ),
                            ),
                            SizedBox(
                              height: 3.h,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Quick Login',
                                  style: TextStyle(
                                      fontSize: 14.sp,
                                      fontWeight: FontWeight.w600),
                                ),
                                CupertinoSwitch(
                                  value: switchcust,
                                  onChanged: (value) {
                                    setState(() {
                                      switchcust = value;
                                    });
                                  },
                                )
                              ],
                            ),
                            SizedBox(
                              height: 7.h,
                            ),
                            Button(text: 'Login')
                          ],
                        ),
                      ),
                      Padding(
                        padding:
                            EdgeInsets.only(top: 1.h, right: 2.h, left: 2.h),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Temp(
                              hinttext: 'Email',
                            ),
                            Temp(
                              ifpassword: true,
                              hinttext: 'Password',
                            ),
                            SizedBox(
                              height: 1.h,
                            ),
                            Align(
                              alignment: Alignment.centerRight,
                              child: Text(
                                'Forgot Password?',
                                style: TextStyle(
                                    fontSize: 11.sp,
                                    color: Color.fromRGBO(42, 183, 199, 1),
                                    fontWeight: FontWeight.w600),
                              ),
                            ),
                            SizedBox(
                              height: 3.h,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Set Quick Login',
                                  style: TextStyle(
                                      fontSize: 14.sp,
                                      fontWeight: FontWeight.w600),
                                ),
                                CupertinoSwitch(
                                  value: switchcust,
                                  onChanged: (value) {
                                    setState(() {
                                      switchcust = value;
                                    });
                                  },
                                )
                              ],
                            ),
                            SizedBox(
                              height: 7.h,
                            ),
                            Button(text: 'Login')
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
