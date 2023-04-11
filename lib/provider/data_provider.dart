import 'package:flutter/material.dart';

class DataProvider extends ChangeNotifier{

  late int workTimeInMinutes;

  DataProvider(){
    workTimeInMinutes = 0;
  }

  void updateWorkTime(int newTime){
    workTimeInMinutes = newTime;
    notifyListeners();
  }

}