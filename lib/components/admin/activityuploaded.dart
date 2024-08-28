import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:teachingapp/reuseable/bottomappbaradmin.dart';
import 'package:teachingapp/reuseable/button.dart';

class Activityuploaded extends StatelessWidget {
  const Activityuploaded({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(),
      body: Column(crossAxisAlignment: CrossAxisAlignment.center,
        children: [SizedBox(height: 3.h),
          Center(child: Text('Activity Uploaded Successfully', style: TextStyle(fontSize: 15.sp, fontWeight: FontWeight.w700),)),
          SizedBox(height: 2.h,),
          Text('Lorem ipsum dolor sit amet', style: TextStyle(fontSize: 15.sp, fontWeight: FontWeight.w200),),
          Text('consectetur adipiscing elit, sed do.', style: TextStyle(fontSize: 15.sp, fontWeight: FontWeight.w200),),
          SizedBox(height: 5.h),
          Image.asset('assets/images/tick.png'),
          SizedBox(height: 10.h),
          Button(text: 'Back To Home', onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context)=>BottomNavBarAdmin()));
          },),
        ],
      ),
    );
  }
}
