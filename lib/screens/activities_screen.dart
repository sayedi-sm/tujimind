import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tujimind/constants.dart';
import 'package:tujimind/widgets/activity_item.dart';

import '../models/activity.dart';

class ActivitiesScreen extends StatelessWidget {
  static const String id = "ActivitiesScreen";

  ActivitiesScreen({Key? key}) : super(key: key);

  final List<Activity> _activities = [
    Activity(
      title: "Hiking",
      subtitle: "Find awesome destinations",
      imageUrl:
          "https://images.unsplash.com/photo-1586022045497-31fcf76fa6cc?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80",
      members: 12938,
    ),
    Activity(
      title: "Sports",
      subtitle: "Find awesome sports to try",
      imageUrl:
          "https://images.unsplash.com/photo-1525914813433-886dc018469d?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80",
      members: 3512,
    ),
    Activity(
      title: "Art Exhibition",
      subtitle: "Find awesome art exhibitions",
      imageUrl:
          "https://images.unsplash.com/photo-1522878308970-972ec5eedc0d?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=435&q=80",
      members: 376,
    ),
    Activity(
      title: "Equine Therapy",
      subtitle: "Find awesome therapy",
      imageUrl:
          "https://images.unsplash.com/photo-1604764352469-2d86fe64ffa5?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=386&q=80",
      members: 4624,
    ),
    Activity(
      title: "Dance",
      subtitle: "Find awesome dance sessions",
      imageUrl:
          "https://images.unsplash.com/photo-1536294738309-2fc595e788fb?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80",
      members: 31070,
    ),
    Activity(
      title: "Wood Work",
      subtitle: "Find awesome artistic activities",
      imageUrl:
          "https://images.unsplash.com/photo-1517505246386-7b6def3b0ef6?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=410&q=80",
      members: 3812,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildTujiAppBar("Activities"),
      body: GridView(
        padding: EdgeInsets.symmetric(horizontal: 16),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 12,
          crossAxisSpacing: 12,
          childAspectRatio: 2 / 3,
        ),
        children: List.generate(
          _activities.length,
          (index) => ActivityItem(_activities[index]),
        ),
      ),
    );
  }
}
