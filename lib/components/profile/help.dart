import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sizer/sizer.dart';
import 'package:teachingapp/reuseable/textfield.dart';

class Help extends StatelessWidget {
  const Help({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: Text('Help'),
      ),
      body: Center(
        child: Column(
          children: [
            CustomTextField(hinttext: 'Email'),
            Container(
              height: 15.h,
              width: screenWidth * 0.9,
              decoration: BoxDecoration(
                border: Border.all(color: Color.fromRGBO(226, 226, 226, 1)),
                borderRadius: BorderRadius.circular(15),
              ),
              child: TextFormField(
                maxLength: 90,
                maxLengthEnforcement: MaxLengthEnforcement.none,
                maxLines: 2,
                decoration: InputDecoration(
                  labelText: 'Query',
                  labelStyle: TextStyle(color: Colors.black),
                  border: InputBorder.none,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
