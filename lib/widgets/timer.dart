import 'dart:async';
import 'package:flutter/material.dart';

class TimerCountDown extends StatefulWidget {
  Duration myDuration;
  
  TimerCountDown({super.key, required this.myDuration});

  @override
  State<TimerCountDown> createState() => _TimerCountDownState();
}

class _TimerCountDownState extends State<TimerCountDown> {
  late Timer countdownTimer;

  String strDigits(int n) => n.toString().padLeft(2, '0');

  void setCountDown() {
    const reduceSecondsBy = 1;
    setState(() {
      final seconds = widget.myDuration.inSeconds - reduceSecondsBy;
      if (seconds < 0) {
        countdownTimer.cancel();
      } else {
        widget.myDuration = Duration(seconds: seconds);
      }
    });
  }

  @override
  void dispose() {
    countdownTimer.cancel();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    countdownTimer = Timer.periodic(const Duration(seconds: 1), (_) => setCountDown());
  }

  @override
  Widget build(BuildContext context) {
    final hours = strDigits(widget.myDuration.inHours.remainder(24));
    final minutes = strDigits(widget.myDuration.inMinutes.remainder(60));
    final seconds = strDigits(widget.myDuration.inSeconds.remainder(60));

    return Text(
      '$hours:$minutes:$seconds',
      style: const TextStyle( fontWeight: FontWeight.bold, color: Colors.red, fontSize: 25),
    );
  }
}