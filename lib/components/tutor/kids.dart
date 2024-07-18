import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class Kids extends StatefulWidget {
  const Kids({super.key});

  @override
  State<Kids> createState() => _ProfileState();
}

class _ProfileState extends State<Kids> {
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
        title: const Text('Kids'),
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(vertical: 2.h, horizontal: 4.w),
        children: const [
          CustomBoxDecoration2(
            imagePath: 'assets/images/Leslie Alexander.png', // Change as needed
            title: 'Leslie Alexander',
            status: 'Completed',
            time: '2 hr ago',
          ),
          CustomBoxDecoration2(
            imagePath: 'assets/images/EstherHoward.png', // Change as needed
            title: 'Esther Howard',
            status: 'Pending',
            time: '',
          ),
          CustomBoxDecoration2(
            imagePath: 'assets/images/RobertFox.png', // Change as needed
            title: 'Robert Fox',
            status: 'Completed',
            time: '2 hr ago',
          ),
          CustomBoxDecoration2(
            imagePath: 'assets/images/Leslie Alexander.png',
            title: 'Leslie Alexander',
            status: 'Completed',
            time: '2 hr ago',
          ),
          CustomBoxDecoration2(
            imagePath: 'assets/images/EstherHoward.png',
            title: 'Esther Howard',
            status: 'Pending',
            time: '',
          ),
          CustomBoxDecoration2(
            imagePath: 'assets/images/RobertFox.png',
            title: 'Robert Fox',
            status: 'Completed',
            time: '2 hr ago',
          ),
        ],
      ),
    );
  }
}

class CustomBoxDecoration2 extends StatelessWidget {
  final String imagePath;
  final String title;
  final String status;
  final String time;

  const CustomBoxDecoration2({
    super.key,
    required this.imagePath,
    required this.title,
    required this.status,
    required this.time,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 2.h),
      padding: EdgeInsets.all(2.h),
      decoration: BoxDecoration(
        color: Colors.white,
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
            backgroundImage: AssetImage(imagePath),
          ),
          SizedBox(width: 4.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(height: 1.h),
                Container(
                  width: double.infinity,
                  padding: EdgeInsets.symmetric(vertical: 1.h),
                  decoration: BoxDecoration(
                    color: status == 'Completed'
                        ? const Color.fromRGBO(227, 252, 252, 1)
                        : const Color.fromRGBO(240, 240, 240, 1),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Text(
                    status,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: status == 'Completed'
                          ? const Color.fromRGBO(42, 183, 199, 1)
                          : Colors.grey,
                      fontSize: 10.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                if (time.isNotEmpty) SizedBox(height: 1.h),
                if (time.isNotEmpty)
                  Text(
                    time,
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
