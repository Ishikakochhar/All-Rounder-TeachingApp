import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sizer/sizer.dart';
import 'package:teachingapp/reuseable/boxcustom.dart';
import 'package:teachingapp/reuseable/button.dart';
import 'package:teachingapp/reuseable/timer.dart';

class Activitysubmit extends StatefulWidget {
  final String title;
  final String description;
  final String date;

  const Activitysubmit({
    required this.title,
    required this.description,
    required this.date,
    super.key,
  });

  @override
  State<Activitysubmit> createState() => _ActivitysubmitState();
}

class _ActivitysubmitState extends State<Activitysubmit> {
  File? _imageFile;
  final ImagePicker _picker = ImagePicker();

  Future<void> _pickFile() async {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return SafeArea(
          child: Wrap(
            children: <Widget>[
              ListTile(
                leading: Icon(Icons.photo_library),
                title: Text('Photo Library'),
                onTap: () async {
                  Navigator.of(context).pop();
                  try {
                    final pickedFile =
                        await _picker.pickImage(source: ImageSource.gallery);
                    if (pickedFile != null) {
                      setState(() {
                        _imageFile = File(pickedFile.path);
                      });
                    }
                  } catch (e) {
                    print("Error picking image: $e");
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Failed to pick image: $e')),
                    );
                  }
                },
              ),
              ListTile(
                leading: Icon(Icons.camera_alt),
                title: Text('Camera'),
                onTap: () async {
                  Navigator.of(context).pop();
                  try {
                    final pickedFile =
                        await _picker.pickImage(source: ImageSource.camera);
                    if (pickedFile != null) {
                      setState(() {
                        _imageFile = File(pickedFile.path);
                      });
                    }
                  } catch (e) {
                    print("Error picking image: $e");
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Failed to pick image: $e')),
                    );
                  }
                },
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Activity'),
      ),
      body: Column(
        children: [
          TimerScreen(
            isClock: false,
            autoStart: true,
          ),
          SizedBox(
            height: 2.h,
          ),
          CustomBoxDecoration(
            title: widget.title,
            description: widget.description,
            date: widget.date,
          ),
          SizedBox(height: 2.h),
          GestureDetector(
            onTap: _pickFile,
            child: Container(
              decoration: BoxDecoration(
                color: const Color.fromRGBO(235, 235, 235, 1),
                borderRadius: BorderRadius.circular(20),
              ),
              height: 37.h,
              width: 88.w,
              child: Center(
                child: _imageFile == null
                    ? Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Upload Media',
                            style: TextStyle(
                              fontSize: 13.sp,
                              color: Colors.grey.shade600,
                            ),
                          ),
                          SizedBox(
                            height: 1.h,
                          ),
                          Image.asset(
                            'assets/images/imagepick.png',
                            height: 8.h,
                          ),
                        ],
                      )
                    : ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: Image.file(
                          _imageFile!,
                          height: 37.h,
                          width: 88.w,
                          fit: BoxFit.cover,
                        ),
                      ),
              ),
            ),
          ),
          SizedBox(
            height: 2.h,
          ),
          Button(
            text: 'Submit',
            onPressed: () {
              print('Submit button pressed');
            },
          ),
        ],
      ),
    );
  }
}
