import 'package:flutter/material.dart';
import 'package:tujimind/constants.dart';
import 'package:tujimind/screens/activities_screen.dart';
import 'package:tujimind/screens/assessment_screen.dart';
import 'package:tujimind/screens/main_screen.dart';
import 'package:tujimind/screens/signup_screen.dart';
import 'package:tujimind/screens/test_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: "Rubik",
        scaffoldBackgroundColor: appColor,
      ),
      home: MainScreen(),
      routes: {
        AssessmentScreen.id: (context) => AssessmentScreen(),
        MainScreen.id: (context) => MainScreen(),
        ActivitiesScreen.id: (context) => MainScreen(),
      },
    );
  }
}
