import 'package:flutter/material.dart';
import 'package:tujimind/constants.dart';
import 'package:tujimind/models/course_card.dart';
import 'package:tujimind/screens/course_details_screen.dart';
import 'package:tujimind/widgets/courses_card_item.dart';
import 'package:tujimind/widgets/search_field.dart';

import '../widgets/tuji_choice_chip.dart';

class CoursesScreen extends StatefulWidget {
  static const String id = "CoursesScreen";

  const CoursesScreen({Key? key}) : super(key: key);

  @override
  State<CoursesScreen> createState() => _CoursesScreenState();
}

class _CoursesScreenState extends State<CoursesScreen> {
  final List<CourseCard> _coursesCards = [
    CourseCard(
      title: "Introduction to Yoga",
      description:
          "This course aims to solve all the issues you might have when starting out in Yoga & meditation.",
      by: "General Mathenge",
      durationString: "6 Sessions / 13 min",
      imageUrl:
          "https://images.unsplash.com/photo-1601925260368-ae2f83cf8b7f?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1480&q=80",
    ),
    CourseCard(
      title: "Better Living",
      description:
          "This course aims to solve all the issues you might have when starting out in Yoga & meditation.",
      by: "Bob Marley Jr",
      durationString: "13 Sessions / 138 min",
      imageUrl:
          "https://images.unsplash.com/photo-1499209974431-9dddcece7f88?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=870&q=80",
    ),
    CourseCard(
      title: "Change Perception",
      description:
          "This course aims to solve all the issues you might have when starting out in Yoga & meditation.",
      by: "Omolo K.",
      durationString: "12 Sessions / 45 min",
      imageUrl:
          "https://images.unsplash.com/photo-1553402233-d0a308ecafb7?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=726&q=80",
    ),
    CourseCard(
      title: "Serene Space Arrangement",
      description:
          "This course aims to solve all the issues you might have when starting out in Yoga & meditation.",
      by: "Jane Doe",
      durationString: "3 Sessions / 23 min",
      imageUrl:
          "https://images.unsplash.com/photo-1522708323590-d24dbb6b0267?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=870&q=80",
    ),
  ];

  Color pagePrimaryColor = tujiGreyColor;

  List<String> _choiceLabels = [
    "All",
    "Life Hacks",
    "Yoga",
  ];

  List<bool> _choiceStates = [true, false, false];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildTujiAppBar("Courses"),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: SearchField(
              hintText: "Search Courses",
              color: pagePrimaryColor,
            ),
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            padding: EdgeInsets.symmetric(vertical: 8, horizontal: 12),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                _choiceLabels.length,
                (index) => Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 4.0),
                  child: TujiChoiceChip(
                    label: _choiceLabels[index],
                    selected: _choiceStates[index],
                    color: pagePrimaryColor,
                    onSelected: (value) {
                      setState(() {
                        _choiceStates[index] = value;
                      });
                    },
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            child: ListView.separated(
              padding: EdgeInsets.symmetric(horizontal: 16),
              itemCount: _coursesCards.length,
              itemBuilder: (ctx, index) => GestureDetector(
                child: CoursesCardItem(_coursesCards[index]),
                onTap: () => Navigator.of(context).pushNamed(
                  CourseDetailsScreen.id,
                  arguments: _coursesCards[index],
                ),
              ),
              separatorBuilder: (ctx, index) => SizedBox(height: 8),
            ),
          ),
        ],
      ),
    );
  }
}
