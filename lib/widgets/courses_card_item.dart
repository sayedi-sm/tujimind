import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tujimind/models/course_card.dart';

import '../constants.dart';

class CoursesCardItem extends StatelessWidget {
  final CourseCard courseCard;

  const CoursesCardItem(this.courseCard, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: cardFillColor,
        border: Border.all(color: cardBorderColor),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: FadeInImage(
              placeholder: const AssetImage("assets/images/placeholder2.jpg"),
              image: NetworkImage(courseCard.imageUrl),
              width: 70,
              height: 80,
              fit: BoxFit.cover,
            ),
          ),
          Positioned(
            top: 0,
            bottom: 0,
            child: Padding(
              padding: const EdgeInsets.only(left: 8 + 70 + 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    courseCard.title,
                    style: const TextStyle(
                      fontSize: 18,
                      letterSpacing: 1,
                    ),
                  ),
                  Text(
                    "By: ${courseCard.by}",
                    style: const TextStyle(color: tujiDarkGreyColor),
                  ),
                  const Spacer(),
                  Row(
                    children: [
                      const Icon(
                        FontAwesomeIcons.clock,
                        size: 16,
                        color: tujiDarkGreyColor,
                      ),
                      const SizedBox(width: 8),
                      Text(
                        courseCard.durationString,
                        style: const TextStyle(
                          color: tujiDarkGreyColor,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
