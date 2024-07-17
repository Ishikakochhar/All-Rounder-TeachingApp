// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sizer/sizer.dart';

class Infobox extends StatelessWidget {
  String text1;
  String text2;
  bool copybutton;
  Infobox(
      {required this.text1,
      this.copybutton = false,
      required this.text2,
      super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Padding(
      padding: EdgeInsets.only(top: 2.h),
      child: Container(
        height: 7.h,
        width: screenWidth * 0.9,
        decoration: BoxDecoration(
          border: Border.all(color: const Color.fromRGBO(226, 226, 226, 1)),
          borderRadius: BorderRadius.circular(15),
        ),
        child: Padding(
          padding: EdgeInsets.only(left: 4.w, top: 0.7.h),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    text1,
                    style:
                        TextStyle(fontSize: 10.sp, fontWeight: FontWeight.w300),
                  ),
                  Text(
                    text2,
                    style:
                        TextStyle(fontSize: 13.sp, fontWeight: FontWeight.w500),
                  )
                ],
              ),
              if (copybutton)
                IconButton(
                    onPressed: () async {
                      if (text2.isNotEmpty) {
                        try {
                          await Clipboard.setData(ClipboardData(text: text2));
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                                content: Text('Copied to Clipboard!')),
                          );
                        } catch (e) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                                content: Text('Failed to copy to clipboard.')),
                          );
                        }
                      }
                    },
                    icon: const Icon(
                      Icons.copy,
                      color: Colors.orange,
                    ))
            ],
          ),
        ),
      ),
    );
  }
}
