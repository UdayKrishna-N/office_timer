import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:office_timer/constants.dart';
import 'package:office_timer/presentation/onboardpage.dart';

void main() async {
  runApp(ProviderScope(child: MyApp()));
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: Constants.scaffoldBackgroundColor,
      ),
      home: OnboardPage(),
    );
  }
}
