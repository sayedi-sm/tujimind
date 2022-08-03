import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tujimind/screens/activities_screen.dart';
import 'package:tujimind/screens/assessment_screen.dart';

import '../constants.dart';
import '../models/therapist.dart';
import '../screens/main_screen.dart';

class TherapistItem extends StatelessWidget {
  final Therapist therapist;

  const TherapistItem(this.therapist, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 140,
      margin: EdgeInsets.symmetric(vertical: 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AspectRatio(
            aspectRatio: 1,
            child: Hero(
              tag: "therapist${(key as ValueKey).value}",
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                ),
                width: 140,
                clipBehavior: Clip.hardEdge,
                child: FadeInImage(
                  placeholder: AssetImage("assets/images/placeholder.png"),
                  image: NetworkImage(therapist.imageUrl),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          SizedBox(width: 16),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                therapist.name,
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Wrap(
                spacing: 4,
                children: [
                  ...List.generate(
                    5,
                    (index) => Icon(
                      index != 4
                          ? FontAwesomeIcons.solidStar
                          : FontAwesomeIcons.solidStarHalfStroke,
                      color: buttonColor,
                      size: 16,
                    ),
                  ),
                ],
              ),
              ...List.generate(
                therapist.specialities.length,
                (index) => Text(
                  therapist.specialities[index],
                  style: TextStyle(fontSize: 12),
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  // Navigator.of(MainScreen.universalContext!).push(
                  //   MaterialPageRoute(
                  //     builder: (context) => ActivitiesScreen(),
                  //   ),
                  // );
                },
                child: Text("Book Appointment"),
                style: ButtonStyle(
                  tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  backgroundColor: MaterialStateProperty.all(buttonColor),
                  shape: MaterialStateProperty.all(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
