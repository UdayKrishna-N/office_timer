import 'dart:async';
import 'package:flutter/material.dart';
import 'package:office_timer/constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

class TimeProvider extends ChangeNotifier{
  TimeProvider(DateTime start){
    startTime = start;
    presentTime = DateTime.now();
    hours = 0;
    minutes = 0;
  }

  late final Timer _timer;
  late DateTime startTime;
  late DateTime presentTime;
  late int hours;
  late int minutes;

  void startClock(){
    _timer = Timer.periodic(Duration(minutes: 1), (timer) {
      presentTime = DateTime.now();
      notifyListeners();
      calculateHours();
      calculateMinutes();
      print(hours);
      print(minutes);
    });
  }

  void calculateHours(){
    var difference = presentTime.difference(startTime);
    hours = difference.inHours;
    notifyListeners();
  }

  void calculateMinutes(){
    var difference = presentTime.difference(startTime);
    minutes = difference.inSeconds % 60;
    notifyListeners();
  }

  void stopClock() async {
    _timer.cancel();
    final pref = await SharedPreferences.getInstance();
    pref.setInt(Constants.startTime, 0);
    super.dispose();
  }

}