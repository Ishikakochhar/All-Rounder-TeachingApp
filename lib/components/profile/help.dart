import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:teachingapp/reuseable/textfield.dart';

class Help extends StatelessWidget {
  const Help({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Help'),
      ),
      body: Center(
        child: Column(
          children: [
            CustomTextField(hinttext: 'Email'),
            Padding(
              padding: EdgeInsets.only(top: 3.h),
              child: Container(
                  height: 15.h,
                  width: screenWidth * 0.9,
                  decoration: BoxDecoration(
                    border: Border.all(
                        color: const Color.fromRGBO(226, 226, 226, 1)),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 3.w, vertical: 0.3.h),
                    child: TextFormField(
                      style: const TextStyle(fontWeight: FontWeight.bold),
                      decoration: const InputDecoration(
                        labelText: 'Query',
                        labelStyle: TextStyle(color: Colors.black),
                        border: InputBorder.none,
                      ),
                    ),
                  )),
            )
          ],
        ),
      ),
    );
  }
}
