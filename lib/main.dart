import 'package:flutter/material.dart';
import 'package:tujimind/constants.dart';
import 'package:tujimind/models/therapist.dart';
import 'package:tujimind/screens/activities_screen.dart';
import 'package:tujimind/screens/assessment_screen.dart';
import 'package:tujimind/screens/audio_test_screen.dart';
import 'package:tujimind/screens/course_details_screen.dart';
import 'package:tujimind/screens/courses_screen.dart';
import 'package:tujimind/screens/library_screen.dart';
import 'package:tujimind/screens/main_screen.dart';
import 'package:tujimind/screens/media_catalogue_screen.dart';
import 'package:tujimind/screens/message_screen.dart';
import 'package:tujimind/screens/screening_screen.dart';
import 'package:tujimind/screens/signup_screen.dart';
import 'package:tujimind/screens/special_groups_screen.dart';
import 'package:tujimind/screens/specific_screening_screen.dart';
import 'package:tujimind/screens/test_screen.dart';
import 'package:tujimind/screens/therapist_detail_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Tujimind",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: "Rubik",
        scaffoldBackgroundColor: appColor,
        toggleableActiveColor: primaryColor,
        checkboxTheme: CheckboxThemeData(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(4),
          ),
        ),
        // platform: TargetPlatform.iOS,
      ),
      home: SignupScreen(),
      routes: {
        AssessmentScreen.id: (context) => AssessmentScreen(),
        MainScreen.id: (context) => MainScreen(),
        ActivitiesScreen.id: (context) => ActivitiesScreen(),
        TherapistDetailsScreen.id: (context) => TherapistDetailsScreen(),
        ScreeningScreen.id: (context) => ScreeningScreen(),
        SpecificScreeningScreen.id: (context) => SpecificScreeningScreen(),
        LibraryScreen.id: (context) => LibraryScreen(),
        SpecialGroupsScreen.id: (context) => SpecialGroupsScreen(),
        MessageScreen.id: (context) => MessageScreen(),
        MediaCatalogueScreen.id: (context) => MediaCatalogueScreen(),
        CoursesScreen.id: (context) => CoursesScreen(),
        CourseDetailsScreen.id: (context) => CourseDetailsScreen(),
      },
    );
  }
}
