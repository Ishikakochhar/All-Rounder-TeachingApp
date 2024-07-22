import 'dart:async';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:sizer/sizer.dart';

class TimerScreen extends StatefulWidget {
  final bool autoStart;
  final bool isClock;

  const TimerScreen({super.key, this.autoStart = false, this.isClock = true});

  @override
  _TimerScreenState createState() => _TimerScreenState();
}

class _TimerScreenState extends State<TimerScreen> {
  int _seconds = 0;
  Timer? _timer;
  bool _isTimerRunning = false;

  @override
  void initState() {
    super.initState();
    if (widget.autoStart) {
      _startTimer();
    }
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  void _startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        _seconds++;
      });
    });
    setState(() {
      _isTimerRunning = true;
    });
  }

  void _stopTimer() {
    _timer?.cancel();
    setState(() {
      _isTimerRunning = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    String formattedTime = DateFormat('HH:mm:ss')
        .format(DateTime(0).add(Duration(seconds: _seconds)));

    return Center(
      child: Container(
        width: 88.w,
        height: 12.5.h,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: const Color.fromRGBO(42, 183, 199, 1),
        ),
        child: Padding(
          padding: EdgeInsets.only(left: 3.w, right: 6.w),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    formattedTime,
                    style: const TextStyle(
                        fontSize: 25,
                        color: Colors.white,
                        fontWeight: FontWeight.w600),
                  ),
                  SizedBox(height: 0.3.h),
                  SizedBox(
                    width: 25.w,
                    child: ElevatedButton(
                      onPressed: _isTimerRunning ? _stopTimer : _startTimer,
                      style: ElevatedButton.styleFrom(
                        foregroundColor:
                            _isTimerRunning ? Colors.black : Colors.white,
                        backgroundColor:
                            _isTimerRunning ? Colors.white : Colors.black,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      child: Text(
                        _isTimerRunning ? 'Stop' : 'Start',
                        style: TextStyle(
                            fontSize: 14.sp, fontWeight: FontWeight.w500),
                      ),
                    ),
                  ),
                ],
              ),
              if (widget.isClock)
                Image.asset(
                  'assets/images/clock.png',
                  width: 15.w,
                  height: 28.h,
                )
              else
                Container()
            ],
          ),
        ),
      ),
    );
  }
}
