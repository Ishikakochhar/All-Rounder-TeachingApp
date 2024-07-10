import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:teachingapp/custom/login.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (context, orientation, deviceType) {
        return const MaterialApp(
          home: Choice(),
        );
      },
    );
  }
}

class Choice extends StatefulWidget {
  const Choice({super.key});

  @override
  State<Choice> createState() => _ChoiceState();
}

class _ChoiceState extends State<Choice> {
  String? _selectedDeliveryType;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
      ),
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                stops: [0, 0.9],
                colors: [
                  Color.fromRGBO(255, 250, 243, 1),
                  Color.fromRGBO(236, 239, 255, 1),
                ],
              ),
            ),
          ),
          Column(
            children: [
              Padding(
                padding: EdgeInsets.only(right: 50.w, top: 5.sp),
                child: Image.asset(
                  'assets/images/Logo.png',
                  width: 32.w,
                  height: 22.h,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(right: 50.w),
                child: Text(
                  'Login As a',
                  style:
                      TextStyle(fontSize: 18.sp, fontWeight: FontWeight.w700),
                ),
              ),
              Center(
                child: Padding(
                  padding: EdgeInsets.only(top: 10.sp),
                  child: Container(
                    width: 85.w,
                    decoration: const BoxDecoration(
                      color: Colors.transparent,
                    ),
                    child: Column(
                      children: [
                        CustomRadioListTile(
                          value: 'Admin',
                          groupValue: _selectedDeliveryType,
                          onChanged: (value) {
                            setState(() {
                              _selectedDeliveryType = value;
                            });
                            if (value == 'Admin') {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const AdminLogin(),
                                ),
                              );
                            }
                          },
                          title: const Text(
                            'Admin',
                            style: TextStyle(
                                color: Color.fromRGBO(42, 183, 199, 1),
                                fontSize: 18),
                          ),
                          activeColor: Color.fromRGBO(42, 183, 199, 1),
                        ),
                        Container(
                          height: 1.5.h,
                          decoration: const BoxDecoration(
                            gradient: LinearGradient(
                              stops: [0, 0.9],
                              colors: [
                                Color.fromRGBO(255, 250, 243, 1),
                                Color.fromRGBO(236, 239, 255, 1),
                              ],
                            ),
                          ),
                        ),
                        CustomRadioListTile(
                          value: 'Governor / Governess',
                          groupValue: _selectedDeliveryType,
                          onChanged: (value) {
                            setState(() {
                              _selectedDeliveryType = value;
                            });
                            if (value == 'Governor / Governess') {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const TutorLogin(),
                                ),
                              );
                            }
                          },
                          title: const Text(
                            'Governor / Governess',
                            style: TextStyle(
                                color: Color.fromRGBO(42, 183, 199, 1),
                                fontSize: 18),
                          ),
                          activeColor: Color.fromRGBO(42, 183, 199, 1),
                        ),
                        Container(
                          height: 1.5.h,
                          decoration: const BoxDecoration(
                            gradient: LinearGradient(
                              stops: [0, 0.9],
                              colors: [
                                Color.fromRGBO(255, 250, 243, 1),
                                Color.fromRGBO(236, 239, 255, 1),
                              ],
                            ),
                          ),
                        ),
                        CustomRadioListTile(
                          value: 'Parent',
                          groupValue: _selectedDeliveryType,
                          onChanged: (value) {
                            setState(() {
                              _selectedDeliveryType = value;
                            });
                            if (value == 'Parent') {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const ParentLogin(),
                                ),
                              );
                            }
                          },
                          title: const Text(
                            'Parent',
                            style: TextStyle(
                                color: Color.fromRGBO(42, 183, 199, 1),
                                fontSize: 18),
                          ),
                          activeColor: Color.fromRGBO(42, 183, 199, 1),
                        ),
                        Container(
                          height: 1.5.h,
                          decoration: const BoxDecoration(
                            gradient: LinearGradient(
                              stops: [0, 0.9],
                              colors: [
                                Color.fromRGBO(255, 250, 243, 1),
                                Color.fromRGBO(236, 239, 255, 1),
                              ],
                            ),
                          ),
                        ),
                        CustomRadioListTile(
                          value: 'Children',
                          groupValue: _selectedDeliveryType,
                          onChanged: (value) {
                            setState(() {
                              _selectedDeliveryType = value;
                            });
                            if (value == 'Children') {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const ChildLogin(),
                                ),
                              );
                            }
                          },
                          title: const Text(
                            'Children',
                            style: TextStyle(
                                color: Color.fromRGBO(42, 183, 199, 1),
                                fontSize: 18),
                          ),
                          activeColor: Color.fromRGBO(42, 183, 199, 1),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 3.h),
                child: Image.asset(
                  'assets/images/youngboy.png',
                  width: 90.w,
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}

class CustomRadioListTile extends StatelessWidget {
  final String value;
  final String? groupValue;
  final Function(String?) onChanged;
  final Widget title;
  final Color activeColor;

  const CustomRadioListTile({
    required this.value,
    required this.groupValue,
    required this.onChanged,
    required this.title,
    required this.activeColor,
  });

  @override
  Widget build(BuildContext context) {
    final bool isSelected = value == groupValue;

    return InkWell(
      onTap: () => onChanged(value),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: Colors.white,
          border: Border(
            bottom: BorderSide(color: Colors.grey.shade300, width: 1.0),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              title,
              CustomRadio(
                isSelected: isSelected,
                activeColor: activeColor,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CustomRadio extends StatelessWidget {
  final bool isSelected;
  final Color activeColor;

  const CustomRadio({
    required this.isSelected,
    required this.activeColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 22.0,
      height: 22.0,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(
          color: isSelected ? Colors.grey : Colors.grey,
          width: 3.0,
        ),
        color: isSelected ? activeColor : Colors.white,
      ),
      child: isSelected
          ? Center(
              child: Container(
                width: 9.0,
                height: 9.0,
                decoration:
                    BoxDecoration(shape: BoxShape.circle, color: activeColor),
              ),
            )
          : null,
    );
  }
}
