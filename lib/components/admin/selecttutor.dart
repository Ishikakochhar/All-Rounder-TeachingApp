import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:teachingapp/components/admin/activityuploaded.dart';
import 'package:teachingapp/components/admin/addactivity.dart';
import 'package:teachingapp/reuseable/button.dart';

class Selecttutor extends StatefulWidget {
  const Selecttutor({super.key});

  @override
  State<Selecttutor> createState() => _ProfileState();
}

class _ProfileState extends State<Selecttutor> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: const Text('Select Tutor'),
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(vertical: 2.h, horizontal: 4.w),
        children:  [
          const CustomBoxDecoration2(
            imagePath: 'assets/images/Leslie Alexander.png', // Change as needed
            title: 'Leslie Alexander',
            status: 'Activity Assigned',
            time: '2 hr ago',
          ),
          const CustomBoxDecoration2(
            imagePath: 'assets/images/EstherHoward.png', // Change as needed
            title: 'Esther Howard',
            status: 'Activity Assigned',
            time: '5 hr ago',
          ),
          const CustomBoxDecoration2(
            imagePath: 'assets/images/RobertFox.png', // Change as needed
            title: 'Robert Fox',
            status: 'Activity Assigned',
            time: '6 hr ago',
          ),
          const CustomBoxDecoration2(
            imagePath: 'assets/images/Leslie Alexander.png',
            title: 'Leslie Alexander',
            status: 'Activity Assigned',
            time: '11 hr ago',
          ),
          const CustomBoxDecoration2(
            imagePath: 'assets/images/EstherHoward.png',
            title: 'Esther Howard',
            status: 'Activity Assigned',
            time: '4 hr ago',
          ),
          const CustomBoxDecoration2(
            imagePath: 'assets/images/RobertFox.png',
            title: 'Robert Fox',
            status: 'Activity Assigned',
            time: '8 hr ago',
          ),
          SizedBox(height: 3.h),
          Button(text: 'Assign Activity', onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => Activityuploaded()));
          },)
        ],
      ),
    );
  }
}

class CustomBoxDecoration2 extends StatefulWidget {
  final String imagePath;
  final String status;
  final String title;
  final String time;

  const CustomBoxDecoration2({
    super.key,
    required this.status,
    required this.imagePath,
    required this.title,
    required this.time,
  });

  @override
  State<CustomBoxDecoration2> createState() => _CustomBoxDecoration2State();
}

class _CustomBoxDecoration2State extends State<CustomBoxDecoration2> {
  bool isChecked = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 2.h),
      padding: EdgeInsets.all(2.h),
      decoration: BoxDecoration(
        color: const Color.fromRGBO(255, 250, 243, 1),
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 2,
            blurRadius: 5,
            offset: const Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CircleAvatar(
            radius: 25.sp,
            backgroundImage: AssetImage(widget.imagePath),
          ),
          SizedBox(width: 4.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      widget.title,
                      style: TextStyle(
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Checkbox(activeColor: const Color.fromRGBO(42, 183, 199, 1), value: isChecked, onChanged: (bool? value) {
                      setState(() {
                        isChecked = value!;
                      });
                    }),
                  ],
                ),
                SizedBox(height: 1.h),
                Container(
                  width: double.infinity,
                  padding: EdgeInsets.symmetric(vertical: 1.h),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Text(
                    widget.status,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 10.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                if (widget.time.isNotEmpty) SizedBox(height: 1.h),
                if (widget.time.isNotEmpty)
                  Text(
                    widget.time,
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 10.sp,
                    ),
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
