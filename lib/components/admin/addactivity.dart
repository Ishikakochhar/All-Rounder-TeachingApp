import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:teachingapp/components/admin/selecttutor.dart';
import 'package:teachingapp/components/tutor/kids.dart';

import '../../reuseable/button.dart';
import '../../reuseable/textfield.dart';

class Addactivity extends StatelessWidget {
  String text;
  Addactivity({required this.text, super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Physical Activity'),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              CustomFormField(text1: 'Activity',),
              CustomFormField(text1: 'Description'),
              CustomTextField(hinttext: 'Date'),
              CustomTextField(hinttext: 'Age'),
              SizedBox(height: 4.h,),
        
              Button(
                text: 'Select Tutor',
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context)=> Selecttutor()));
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}



