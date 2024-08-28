import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:teachingapp/reuseable/button.dart';
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
            CustomFormField(text1: 'Query',),
            SizedBox(height: 5.h,),
            Button(
              text: 'Submit',
              onPressed: () {},
            )
          ],
        ),
      ),
    );
  }
}
