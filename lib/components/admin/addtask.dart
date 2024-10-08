import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:teachingapp/components/common/task/taskprogress.dart'; // Import the Taskprogress component
import 'package:teachingapp/reuseable/button.dart'; // Import reusable components
import 'package:teachingapp/reuseable/datepicker.dart'; // Import reusable date picker

void main() {
  runApp(ActivityApp());
}

class ActivityApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ActivityScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class ActivityScreen extends StatefulWidget {
  @override
  _ActivityScreenState createState() => _ActivityScreenState();
}

class _ActivityScreenState extends State<ActivityScreen> with SingleTickerProviderStateMixin {
  late TabController _tabController;
  String _selectedActivityType = 'Mindfulness Activity';
  String _selectedAgeGroup = '5';
  bool _timerEnabled = true;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  final List<Map<String, String>> childrenData = [
    {"name": "Jerome Bell", "date": "10.02.2019"},
    {"name": "Albert Flores", "date": "12.03.2020"},
    {"name": "Ralph Edwards", "date": "05.11.2021"},
    {"name": "Savannah Nguyen", "date": "01.08.2021"},
    {"name": "Marvin McKinney", "date": "19.07.2022"},
    {"name": "Eleanor Pena", "date": "20.06.2023"},
    {"name": "Floyd Miles", "date": "15.09.2018"},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {},
        ),
        title: Text(
          'Leslie Alexander',
          style: TextStyle(color: Colors.black),
        ),
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(60),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 3.w),
            child: Container(
              decoration: BoxDecoration(color: Color.fromRGBO(233, 253, 255, 1),borderRadius: BorderRadius.circular(15)),
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 0.5.h),
                child: TabBar(dividerColor: Colors.white,
                  controller: _tabController,
                  labelColor: Colors.white,
                  unselectedLabelColor: Colors.black,
                  indicator: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Color.fromRGBO(42, 183, 199, 1),
                  ),
                  tabs: [
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 2.w),
                      child: Tab(text: 'Add Activity'),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 3.w),
                      child: Tab(text: 'Children'),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 3.w),
                      child: Tab(text: 'Past Activity'),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          _buildAddActivityTab(),
          _buildChildrenTab(),
          _buildPastActivityTab(),
        ],
      ),
    );
  }

  Widget _buildAddActivityTab() {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            DropdownButtonFormField<String>(
              value: _selectedActivityType,
              decoration: InputDecoration(
                labelText: 'Activity Type',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30.0),
                ),
                filled: true,
                fillColor: Colors.white,
              ),
              items: ['Mindfulness Activity', 'Physical Activity', 'Emotional Activity', 'Cognitive Activity', 'Social Activity']
                  .map((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
              onChanged: (String? newValue) {
                setState(() {
                  _selectedActivityType = newValue!;
                });
              },
            ),
            SizedBox(height: 16),
            TextFormField(
              decoration: InputDecoration(
                labelText: 'Activity',
                hintText: 'Name five leafy vegetables with a vitamin name.',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                filled: true,
                fillColor: Colors.white,
              ),
            ),
            SizedBox(height: 16),
            TextFormField(
              maxLines: 3,
              decoration: InputDecoration(
                labelText: 'Description',
                hintText: 'Enter a description for the activity',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                filled: true,
                fillColor: Colors.white,
              ),
            ),
            SizedBox(height: 16),
            TextFormField(
              decoration: InputDecoration(
                labelText: 'Submission Date',
                hintText: 'DD.MM.YY',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                filled: true,
                fillColor: Colors.white,
              ),
            ),
            SizedBox(height: 16),
            DropdownButtonFormField<String>(
              value: _selectedAgeGroup,
              decoration: InputDecoration(
                labelText: 'Age Group',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                filled: true,
                fillColor: Colors.white,
              ),
              items: ['3', '4', '5', '6'].map((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
              onChanged: (String? newValue) {
                setState(() {
                  _selectedAgeGroup = newValue!;
                });
              },
            ),
            SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Timer',
                  style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
                ),
                Switch(
                  value: _timerEnabled,
                  activeColor: Colors.blue, // Change toggle color to blue
                  onChanged: (bool value) {
                    setState(() {
                      _timerEnabled = value;
                    });
                  },
                ),
              ],
            ),
            SizedBox(height: 20),
            Button(text: 'Assign Activity', onPressed: () {

            },)
          ],
        ),
      ),
    );
  }


  Widget _buildChildrenTab() {
    return ListView.builder(
      padding: const EdgeInsets.all(16.0),
      itemCount: childrenData.length,
      itemBuilder: (context, index) {
        final child = childrenData[index];
        return Card(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          color: Colors.white70,
          margin: EdgeInsets.symmetric(vertical: 8.0),
          child: ListTile(
            leading: CircleAvatar(
              backgroundImage: AssetImage('assets/images/child$index.png'), // Dummy image path
              radius: 25,
            ),
            title: Text(child["name"]!),
            subtitle: Text(child["date"]!),
          ),
        );
      },
    );
  }

  Widget _buildPastActivityTab(){

    return SingleChildScrollView(child: TaskProgAssign()); //
  }
}

class TaskProgAssign extends StatelessWidget {
  const TaskProgAssign({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Datepicker(),
        SizedBox(
          height: 3.h,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            TaskBox(
              text1: 'Task',
              text2: 'Completed',
              widget: Text(
                '0',
                style: TextStyle(fontSize: 30.sp),
              ),
            ),
            TaskBox(
              text1: 'Time',
              text2: 'Duration',
              widget: RichText(
                text: TextSpan(
                    style: const TextStyle(color: Colors.black),
                    children: [
                      TextSpan(text: '0', style: TextStyle(fontSize: 30.sp)),
                      TextSpan(text: 'h ', style: TextStyle(fontSize: 18.sp)),
                      TextSpan(text: '00', style: TextStyle(fontSize: 30.sp)),
                      TextSpan(text: 'm ', style: TextStyle(fontSize: 18.sp))
                    ]),
              ),
              ifTimeDuration: true,
            )
          ],
        ),
        SizedBox(child: Center(child: Text('No Task Found', style: TextStyle(fontSize: 15.sp),)), height: 36.h,)
      ],
    );
  }
}

