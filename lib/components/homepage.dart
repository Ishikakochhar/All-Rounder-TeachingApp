import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:teachingapp/components/common/profile/profile.dart';
import 'package:teachingapp/reuseable/bottombar.dart';
import 'tutor1.dart'; // Import your tutor1.dart file

class Homepage extends StatelessWidget {
  String profilename;
  Homepage({this.profilename = 'John', super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
        title: Row(
          children: [
            const CircleAvatar(
              radius: 23.0,
              backgroundImage: AssetImage('assets/images/john.png'),
            ),
            const SizedBox(width: 10.0),
            RichText(
              text: TextSpan(
                text: 'Hey ',
                children: [
                  TextSpan(text: '$profilename\n'),
                  const TextSpan(text: 'Welcome Back')
                ],
                style: const TextStyle(
                  fontSize: 12.0,
                  fontWeight: FontWeight.w400,
                  color: Color.fromRGBO(0, 0, 0, 1),
                ),
              ),
            ),
          ],
        ),
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 20.0),
        children: [
          Container(
            width: double.infinity,
            margin: EdgeInsets.symmetric(vertical: 0.5.h),
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  Color.fromRGBO(255, 250, 243, 1),
                  Color.fromRGBO(236, 239, 255, 1),
                ],
              ),
              borderRadius: BorderRadius.circular(12.0),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 2,
                  blurRadius: 5,
                  offset: const Offset(0, 3),
                ),
              ],
            ),
            padding: const EdgeInsets.all(10.0),
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 0.1.h),
                      const Text(
                        'You have \ncompleted',
                        style: TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Poppins',
                        ),
                      ),
                      Text(
                        '200+ Activity',
                        style: TextStyle(
                          fontSize: 19.sp,
                          fontWeight: FontWeight.w700,
                          color: const Color.fromRGBO(108, 146, 193, 1),
                        ),
                      ),
                      const SizedBox(height: 2.0),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                          backgroundColor:
                              const Color.fromRGBO(42, 183, 199, 1),
                        ),
                        onPressed: () {
                          // Add onPressed action for View Progress button
                        },
                        child: const Text(
                          'View Progress',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 13,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 12.0),
                Stack(
                  alignment: Alignment.center,
                  children: [
                    CircularPercentIndicator(
                      radius: 65.0,
                      lineWidth: 18.0,
                      percent: 0.8,
                      center: Container(
                        width: 100,
                        height: 100,
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.circle,
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(
                              '80%',
                              style: TextStyle(
                                fontSize: 22.0,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                            ),
                            Text(
                              'Activities',
                              style: TextStyle(
                                fontSize: 14.0,
                                color: Colors.grey[600],
                              ),
                            ),
                            Text(
                              'Completed',
                              style: TextStyle(
                                fontSize: 14.0,
                                color: Colors.grey[600],
                              ),
                            ),
                          ],
                        ),
                      ),
                      backgroundColor: Colors.blue.shade100,
                      progressColor: Colors.blue,
                      circularStrokeCap: CircularStrokeCap.round,
                    ),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(height: 15.0),
          StaggeredGridView.countBuilder(
            crossAxisCount: 2,
            itemCount: 5,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            mainAxisSpacing: 20.0,
            crossAxisSpacing: 20.0,
            staggeredTileBuilder: (int index) {
              if (index == 0 || index == 1) {
                return const StaggeredTile.fit(1);
              } else {
                return const StaggeredTile.fit(1);
              }
            },
            itemBuilder: (BuildContext context, int index) {
              String imagePath;
              double containerHeight;
              double imageHeight;

              switch (index) {
                case 0:
                  imagePath = 'assets/images/Physicalactivity.png';
                  containerHeight = 25.h;
                  imageHeight = 15.h;
                  break;
                case 1:
                  imagePath = 'assets/images/Mindfullness.png';
                  containerHeight = 16.h;
                  imageHeight = 20.h;
                  break;
                case 2:
                  imagePath = 'assets/images/cognitive activity.png';
                  containerHeight = 16.h;
                  imageHeight = 15.h;
                  break;
                case 3:
                  imagePath = 'assets/images/Emotional Activity.png';
                  containerHeight = 25.h;
                  imageHeight = 15.h;
                  break;
                case 4:
                  imagePath = 'assets/images/badge.png';
                  containerHeight = 16.h;
                  imageHeight = 15.h;
                  break;
                default:
                  imagePath = '';
                  containerHeight = 0;
                  imageHeight = 0;
                  break;
              }

              return GestureDetector(
                onTap: () {
                  // Navigation based on index
                  switch (index) {
                    case 0:
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const Tutor1()),
                      );
                      break;
                    default:
                      break;
                  }
                },
                child: Container(
                  height: containerHeight,
                  padding: const EdgeInsets.all(16.0),
                  decoration: BoxDecoration(
                    color: const Color.fromRGBO(222, 238, 254, 1),
                    borderRadius: BorderRadius.circular(12.0),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 2,
                        blurRadius: 5,
                        offset: const Offset(0, 3),
                      ),
                    ],
                  ),
                  child: Center(
                    child: SizedBox(
                      height: imageHeight,
                      child: Image.asset(
                        imagePath,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
