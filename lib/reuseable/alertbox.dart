import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:teachingapp/reuseable/button.dart';

class AlertBox extends StatefulWidget {
  final String title;
  final IconData icon;
  final VoidCallback onConfirm;
  final VoidCallback onCancel;

  AlertBox({
    required this.title,
    required this.icon,
    required this.onConfirm,
    required this.onCancel,
    Key? key,
  }) : super(key: key);

  @override
  _AlertBoxState createState() => _AlertBoxState();
}

class _AlertBoxState extends State<AlertBox> {
  @override
  Widget build(BuildContext context) {
    return Dialog(
      alignment: Alignment.bottomCenter,
      child: Container(
        height: 33.h,
        padding: EdgeInsets.symmetric(horizontal: 5.w),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              '${widget.title} Account',
              style: TextStyle(fontSize: 15.sp, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 1.8.h),
            Text(
              'Are you sure to ${widget.title.toLowerCase()} the account?',
              style: TextStyle(fontSize: 10.sp, fontWeight: FontWeight.w600),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 2.5.h),
            Icon(
              widget.icon,
              size: 42,
              color: Colors.black,
            ),
            SizedBox(height: 2.5.h),
            Button(
              onPressed: widget.onConfirm,
              text: widget.title,
            ),
            SizedBox(height: 1.2.h),
            Text(
              'No',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12.sp),
            )
          ],
        ),
      ),
    );
  }
}
