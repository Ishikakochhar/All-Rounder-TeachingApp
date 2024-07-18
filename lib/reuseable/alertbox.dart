import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:teaching/Reusable/button.dart'; // Adjust import path as needed

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
  AlertBoxState createState() => AlertBoxState();
}

class _AlertBoxState extends State<AlertBox> {
  @override
  Widget build(BuildContext context) {
    return FractionallySizedBox(
      heightFactor: 0.32,
      child: Container(
        padding: const EdgeInsets.all(7.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              '${widget.title} Account',
              style: TextStyle(fontSize: 15.sp, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 1.h),
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
            SizedBox(height: 1.h),
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
