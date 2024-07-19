import 'package:flutter/material.dart';
import 'package:teachingapp/reuseable/datepicker.dart';

class Taskhistory extends StatelessWidget {
  Taskhistory({super.key});
  List fruits = ['apple', 'banana', 'mango', 'papaya', 'orange', 'guava'];
  int selectedIndex = -1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('History'),
      ),
      body: Column(
        children: [
          Datepicker(),
        ],
      ),
    );
  }
}
