import 'package:flutter/material.dart';
import 'package:office_timer/constants.dart';
import 'dart:core';
import 'package:shared_preferences/shared_preferences.dart';

class DataProvider extends ChangeNotifier{

  late DateTime startTime;
  late int totalHours;
  late int totalMinutes;

  void getWorkTime() async {
    final pref = await SharedPreferences.getInstance();
    startTime = DateTime.fromMillisecondsSinceEpoch(pref.getInt(Constants.startTime)!);
  }


  void updateWorkTime({ required int hours, required int minutes}) async{
    startTime = DateTime.now();
    notifyListeners();
    final pref = await SharedPreferences.getInstance();
    pref.setInt(Constants.startTime, startTime.millisecondsSinceEpoch);
    totalHours = hours;
    notifyListeners();
    totalMinutes = minutes;
    notifyListeners();
  }

}