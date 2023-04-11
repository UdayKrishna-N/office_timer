import 'dart:async';
import 'package:flutter/material.dart';

class TimeProvider extends ChangeNotifier{
  TimeProvider(int time){
    presentTime = 0;
    totalTime = time;
    hours = 0;
    minutes = 0;
  }

  late final Timer _timer;
  late int presentTime;
  late int totalTime;
  late int hours;
  late int minutes;

  void startClock(){
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      presentTime++;
      notifyListeners();
      calculateHours();
      calculateMinutes();
      if(totalTime == presentTime){
        stopClock();
      }
    });
  }

  void calculateHours(){
    hours = (presentTime/60).floor();
    notifyListeners();
  }

  void calculateMinutes(){
    minutes = presentTime % 60;
    notifyListeners();
  }

  void stopClock(){
    _timer.cancel();
    super.dispose();
  }

}