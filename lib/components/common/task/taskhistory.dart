import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:teachingapp/components/tutor1.dart';
import 'package:teachingapp/reuseable/boxcustom.dart';
import 'package:teachingapp/reuseable/datepicker.dart';

class Taskhistory extends StatefulWidget {
  Taskhistory({super.key});

  @override
  State<Taskhistory> createState() => _TaskhistoryState();
}

class _TaskhistoryState extends State<Taskhistory> {
  final List<String> _filters = [
    'Physical Activty',
    'Mindfulness Activty',
    'Cognitive Activity',
    'Emotional Activity',
  ];
  List<Map<String, String>> activities = [
    {
      'title': 'Balance Beam',
      'description':
          'Try more lines at different angles, spirals, and zig-zags.',
      'date': 'July 16, 2022',
    },
    {
      'title': 'Dancing!',
      'description':
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do.',
      'date': 'July 16, 2022',
    },
    {
      'title': 'Headstands',
      'description':
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do.',
      'date': 'July 16, 2022',
    },
  ];

  Set<String> _selectedFilters = Set<String>();

  var _isselected = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('History'),
      ),
      body: Column(
        children: [
          Datepicker(),
          SizedBox(height: 16.0), // Space between Datepicker and chips
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: _filters.map((filter) {
                return Padding(
                  padding: EdgeInsets.symmetric(horizontal: 1.w),
                  child: FilterChip(
                    selectedColor: Colors.black,
                    shape: StadiumBorder(
                        side: BorderSide(width: 2, style: BorderStyle.none)),
                    backgroundColor: Colors.grey.shade400,
                    avatar: null,
                    showCheckmark: false,
                    labelStyle: TextStyle(color: Colors.white),
                    label: Text(filter),
                    selected: _selectedFilters.contains(filter),
                    onSelected: (bool selected) {
                      setState(() {
                        if (selected) {
                          _selectedFilters.add(filter);
                        } else {
                          _selectedFilters.remove(filter);
                        }
                      });
                    },
                  ),
                );
              }).toList(),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: activities.length,
              itemBuilder: (BuildContext context, int index) {
                return Padding(
                  padding: EdgeInsets.symmetric(vertical: 1.h),
                  child: CustomBoxDecoration(
                    title: activities[index]['title'] ?? '',
                    description: activities[index]['description'] ?? '',
                    date: activities[index]['date'] ?? '',
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
