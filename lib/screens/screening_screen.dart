import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tujimind/constants.dart';
import 'package:tujimind/widgets/custom_button.dart';
import 'package:tujimind/widgets/tuji_card_item.dart';

import '../models/tuji_card.dart';

class ScreeningScreen extends StatelessWidget {
  static const String id = "ScreeningScreen";

  ScreeningScreen({Key? key}) : super(key: key);

  final List<TujiCard> _tujiCards = [
    TujiCard(
      title: "Screening",
      icon: FontAwesomeIcons.personDotsFromLine,
      color: const Color(0xFF6F59F3),
      onTap: () {},
    ),
    TujiCard(
      title: "ADHD Screening",
      icon: FontAwesomeIcons.personBooth,
      color: const Color(0xFFED8356),
      onTap: () {},
    ),
    TujiCard(
      title: "Depression Screening",
      icon: FontAwesomeIcons.peopleRobbery,
      color: const Color(0xFF267DBD),
      onTap: () {},
    ),
    TujiCard(
      title: "Eating Disorder",
      icon: FontAwesomeIcons.burger,
      color: const Color(0xFF44AE80),
      onTap: () {},
    ),
    TujiCard(
      title: "Substance Use Disorder",
      icon: FontAwesomeIcons.beerMugEmpty,
      color: const Color(0xFFD87979),
      onTap: () {},
    ),
    TujiCard(
      title: "Personality Test",
      icon: FontAwesomeIcons.person,
      color: const Color(0xFFB7B7B7),
      onTap: () {},
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildTujiAppBar("Screening"),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                Text("This is self diagnosis"),
                Image.asset("assets/images/screening_illustration.png"),
                Text(
                  "By taking a screening, you are starting it the right "
                  "way. Identifying the problem to avoid misdiagnosis.",
                  style: TextStyle(fontSize: 16),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
            GridView(
              shrinkWrap: true,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                mainAxisSpacing: 8,
                crossAxisSpacing: 8,
              ),
              children: List.generate(
                _tujiCards.length,
                    (index) => TujiCardItem(_tujiCards[index]),
              ),
            ),
            CustomButton(
              child: Text("Request Clinical Screening"),
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}
