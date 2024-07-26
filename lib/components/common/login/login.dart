// ignore_for_file: prefer_const_constructors
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:local_auth/local_auth.dart';
import 'package:sizer/sizer.dart';
import 'package:teachingapp/components/homepage.dart';
import 'package:teachingapp/reuseable/bottombar.dart';
import 'package:teachingapp/reuseable/button.dart';
import 'package:teachingapp/reuseable/textfield.dart';

class CustomLogin extends StatefulWidget {
  String logintype;
  CustomLogin({required this.logintype, super.key});

  @override
  State<CustomLogin> createState() => _CustomLoginState();
}

class _CustomLoginState extends State<CustomLogin>
    with TickerProviderStateMixin {
  bool isBiometric = false;
  bool switchcust = false;
  late TabController _tabController;

  Future<bool> authenticateWithBiometric() async {
    final LocalAuthentication localAuthentication = LocalAuthentication();
    final bool isBiometricSupported =
        await localAuthentication.isDeviceSupported();
    final bool canCheckBiometrics =
        await localAuthentication.canCheckBiometrics;
    bool isAuthentificated = false;
    if (isBiometricSupported && canCheckBiometrics) {
      isAuthentificated = await localAuthentication.authenticate(
          localizedReason: 'Please Complete Biometrics to Proceed');
    }

    return isAuthentificated;
  }

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
        title: Text(widget.logintype),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(
              stops: const [0, 0.9],
              colors: const [
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
                      tabs: const [
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
                      SingleChildScrollView(
                        child: Padding(
                          padding:
                              EdgeInsets.only(top: 1.h, right: 2.h, left: 2.h),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              CustomTextField(
                                hinttext: 'Phone Number',
                                ifphone: true,
                              ),
                              CustomTextField(
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
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Quick Login',
                                    style: TextStyle(
                                        fontSize: 14.sp,
                                        fontWeight: FontWeight.w600),
                                  ),
                                  CupertinoSwitch(
                                    value: switchcust,
                                    onChanged: (value) async {
                                      isBiometric =
                                          await authenticateWithBiometric();
                                      setState(() {
                                        switchcust = value;
                                        if (switchcust) {
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      BottomNavBarWithPageView()));
                                        }
                                      });
                                    },
                                  )
                                ],
                              ),
                              SizedBox(
                                height: 7.h,
                              ),
                              Button(
                                text: 'Login',
                                onPressed: () {},
                              )
                            ],
                          ),
                        ),
                      ),
                      SingleChildScrollView(
                        child: Padding(
                          padding:
                              EdgeInsets.only(top: 1.h, right: 2.h, left: 2.h),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              CustomTextField(
                                hinttext: 'Email',
                              ),
                              CustomTextField(
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
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Set Quick Login',
                                    style: TextStyle(
                                        fontSize: 14.sp,
                                        fontWeight: FontWeight.w600),
                                  ),
                                  CupertinoSwitch(
                                    value: switchcust,
                                    onChanged: (value) async {
                                      isBiometric =
                                          await authenticateWithBiometric();
                                      setState(() {
                                        switchcust = value;
                                        if (switchcust) {
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      Homepage()));
                                        }
                                      });
                                    },
                                  )
                                ],
                              ),
                              SizedBox(
                                height: 7.h,
                              ),
                              GestureDetector(
                                  child: Button(
                                text: 'Login',
                                onPressed: () {},
                              ))
                            ],
                          ),
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

class TutorLogin extends StatelessWidget {
  const TutorLogin({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomLogin(
      logintype: 'Tutor Login',
    );
  }
}

class AdminLogin extends StatelessWidget {
  const AdminLogin({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomLogin(
      logintype: 'Admin Login',
    );
  }
}

class ParentLogin extends StatelessWidget {
  const ParentLogin({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomLogin(
      logintype: 'Parent Login',
    );
  }
}

class ChildLogin extends StatelessWidget {
  const ChildLogin({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomLogin(
      logintype: 'Child Login',
    );
  }
}
