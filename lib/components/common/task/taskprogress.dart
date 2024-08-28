import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:teachingapp/reuseable/datepicker.dart';

class Taskprogress extends StatefulWidget {
  const Taskprogress({super.key});

  @override
  State<Taskprogress> createState() => _TaskprogressState();
}

class _TaskprogressState extends State<Taskprogress> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Task Progress'),
      ),
      body: Column(
        children: [
          const Datepicker(),
          SizedBox(
            height: 3.h,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              TaskBox(
                text1: 'Task',
                text2: 'Completed',
                widget: Text(
                  '0',
                  style: TextStyle(fontSize: 30.sp),
                ),
              ),
              TaskBox(
                text1: 'Time',
                text2: 'Duration',
                widget: RichText(
                  text: TextSpan(
                      style: const TextStyle(color: Colors.black),
                      children: [
                        TextSpan(text: '0', style: TextStyle(fontSize: 30.sp)),
                        TextSpan(text: 'h ', style: TextStyle(fontSize: 18.sp)),
                        TextSpan(text: '00', style: TextStyle(fontSize: 30.sp)),
                        TextSpan(text: 'm ', style: TextStyle(fontSize: 18.sp))
                      ]),
                ),
                ifTimeDuration: true,
              )
            ],
          ),
          SizedBox(child: Center(child: Text('No Task Found', style: TextStyle(fontSize: 15.sp),)), height: 40.h,)
        ],
      ),
    );
  }
}

class TaskBox extends StatelessWidget {
  bool ifTimeDuration;
  String text1;
  String text2;
  Widget widget;
  TaskBox(
      {this.ifTimeDuration = false,
        required this.text1,
        required this.text2,
        required this.widget,
        super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
                color: Colors.grey.shade200,
                spreadRadius: 2,
                blurRadius: 10,
                offset: const Offset(5, 6))
          ],
          borderRadius: BorderRadius.circular(17),
          border: Border.all(color: const Color.fromRGBO(237, 237, 237, 1))),
      height: 16.h,
      width: 43.w,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 3.w, vertical: 1.5.h),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Image.asset(
                  ifTimeDuration
                      ? 'assets/images/Icon Stopwatch.png'
                      : 'assets/images/Icon Check.png',
                  height: 4.h,
                ),
                SizedBox(
                  width: 3.w,
                ),
                Text(
                  '$text1\n$text2',
                  style:
                  TextStyle(fontSize: 11.sp, fontWeight: FontWeight.w600),
                ),
              ],
            ),
            Align(alignment: Alignment.bottomLeft, child: widget),
          ],
        ),
      ),
    );
  }
}
