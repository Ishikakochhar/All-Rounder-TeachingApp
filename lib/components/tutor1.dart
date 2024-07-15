import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:teachingapp/reuseable/boxcustom.dart';

class Tutor1 extends StatefulWidget {
  const Tutor1({super.key});

  @override
  State<Tutor1> createState() => _Tutor1State();
}

class _Tutor1State extends State<Tutor1> {
  List<Map<String, String>> activities = [
    {
      'title': 'Balance Beam',
      'description':
          'Try more lines at different angles, spirals, and zig-zags.',
      'date': 'July 16, 2022',
    },
    {
      'title': 'Dancing!',
      'description':
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do.',
      'date': 'July 16, 2022',
    },
    {
      'title': 'Headstands',
      'description':
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do.',
      'date': 'July 16, 2022',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Physical Activity'),
      ),
      body: ListView.builder(
        itemCount: activities.length,
        itemBuilder: (BuildContext context, int index) {
          return Padding(
            padding: EdgeInsets.symmetric(vertical: 1.h),
            child: CustomBoxDecoration(
              title: activities[index]['title'] ?? '',
              description: activities[index]['description'] ?? '',
              date: activities[index]['date'] ?? '',
            ),
          );
        },
      ),
    );
  }
}
