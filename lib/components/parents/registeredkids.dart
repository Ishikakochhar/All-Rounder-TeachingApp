import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:teachingapp/components/child/childprofile.dart';
import 'package:teachingapp/reuseable/boxcustom.dart';

class Registeredkids extends StatelessWidget {
  const Registeredkids({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: Text('Kids Profile'),
      ),
      body: Padding(
        padding:  EdgeInsets.symmetric(horizontal: 4.w),
        child: Column(
          children: [
            Text('Registered Kids', style: TextStyle(fontSize: 15.sp)),
            CustomBoxDecoration6(title: 'Kids Name'),
            CustomBoxDecoration6(title: 'Kids Name')
          ],
        ),
      ),
    );
  }
}

class CustomBoxDecoration6 extends StatelessWidget {
  final String title;
  bool dialog;
  Widget? pageroute;
  Widget? dialogbox;

  CustomBoxDecoration6(
      {Key? key,
        required this.title,
        this.dialog = false,
        this.dialogbox,
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
                Navigator.push(context, MaterialPageRoute(builder: (context) => Childprofile()));
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
                child: Column(mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(left: 3.w),
                          child: Text(
                            title,
                            style: TextStyle(
                                fontSize: 12.sp, fontWeight: FontWeight.w600),
                          ),
                        ),
                        Icon(Icons.arrow_forward_ios_sharp)
                      ],
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
