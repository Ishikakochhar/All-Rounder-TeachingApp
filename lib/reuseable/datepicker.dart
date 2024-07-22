import 'package:easy_date_timeline/easy_date_timeline.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class Datepicker extends StatelessWidget {
  const Datepicker({super.key});

  @override
  Widget build(BuildContext context) {
    return EasyDateTimeLine(
      initialDate: DateTime.now(),
      onDateChange: (selectedDate) {},
      activeColor: const Color.fromRGBO(57, 204, 221, 1),
      headerProps:
          const EasyHeaderProps(monthPickerType: MonthPickerType.dropDown),
      dayProps: EasyDayProps(
        height: 9.h,
        width: 18.w,
        dayStructure: DayStructure.dayStrDayNum,
        inactiveDayStyle: DayStyle(
          decoration: BoxDecoration(
              color: const Color.fromRGBO(238, 246, 255, 1),
              borderRadius: BorderRadius.circular(10)),
          dayNumStyle: const TextStyle(
            fontSize: 18.0,
          ),
        ),
        activeDayStyle: DayStyle(
          decoration: BoxDecoration(
              color: const Color.fromRGBO(57, 204, 221, 1),
              borderRadius: BorderRadius.circular(10)),
          dayStrStyle: const TextStyle(fontSize: 13),
          dayNumStyle: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}
