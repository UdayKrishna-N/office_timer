import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:office_timer/constants.dart';
import 'package:office_timer/loading.dart';
import 'package:office_timer/presentation/homepage.dart';
import 'package:office_timer/presentation/loading_page.dart';
import 'package:office_timer/presentation/onboardpage.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  runApp(ProviderScope(child: MyApp()));
}


class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  late int startTime;
  Loading state = Loading.processing;

  @override
  void initState() {
    super.initState();
    _getStartTime();
  }

  _getStartTime() async {
    final pref = await SharedPreferences.getInstance();
    startTime = pref.getInt(Constants.startTime) ?? 0;
    state = Loading.success;
    setState(() {});
  }

  content(Loading state){
    switch(state) {
      case Loading.processing:
        return LoadingPage();
      case Loading.success:
        return startTime == 0 ? OnboardPage() : HomePage(startTime: startTime,);
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: Constants.scaffoldBackgroundColor,
      ),
      home: content(state),
    );
  }
}
