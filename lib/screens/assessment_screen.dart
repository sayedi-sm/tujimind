import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:tujimind/constants.dart';
import 'package:tujimind/widgets/age_card.dart';
import 'package:tujimind/widgets/checkbox_card.dart';
import 'package:tujimind/widgets/radio_card.dart';

class AssessmentScreen extends StatelessWidget {
  static const String id = "AssessmentScreen";

  AssessmentScreen({Key? key}) : super(key: key);

  final _pages = [
    const AgeCard(title: "How old are you?"),
    const RadioCard(
      title: "What is your Gender?",
      list: ["Femal", "Male", "Prefer not to say"],
    ),
    const RadioCard(
      title: "What is your sexual Orientation?",
      list: ["Straight", "Lesbian", "Gay", "Queer", "Prefer not to say"],
    ),
    const RadioCard(
      title: "Have you been to therapy before?",
      list: ["Yes", "No"],
    ),
    const RadioCard(
      title: "Are you currently on Medication?",
      list: ["Yes", "No"],
    ),
    const RadioCard(
      title: "Have you been to therapy before?",
      list: ["Yes", "No"],
    ),
    const RadioCard(
      title: "Do you have any Medical Condition?",
      list: ["Yes", "No"],
    ),
    const RadioCard(
      title: "Have you been to therapy before?",
      list: ["Yes", "No"],
    ),
    const RadioCard(
      title: "Do you have any disability?",
      list: ["Yes", "No"],
    ),
    const RadioCard(
      title: "Have you ever experienced panic attacks?",
      list: ["Yes", "No"],
    ),
    const CheckboxCard(
      title: "What areas do you want to work on?",
      list: [
        "Productivity",
        "Mood",
        "Confidence",
        "Social Skills",
        "Relationships",
        "Sleep",
        "Procrastination",
        "Substance/alcohol",
        "Other",
      ],
    ),
    const CheckboxCard(
      title: "Choose your hobbies",
      list: [
        "Drawing",
        "Hiking",
        "Singing",
        "Swimming",
        "Travelling",
        "Blogging",
        "Vlogging",
        "Acting",
        "Writing",
      ],
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: assessmentScreenColor,
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(28.0),
              child: Column(
                children: const [
                  Text(
                    "Preliminary Assessment",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  Text(
                    "We need to know a few things about you "
                    "in order to give you a bespoke treatment plan",
                    style: TextStyle(fontSize: 16),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
            Expanded(
              child: IntroductionScreen(
                rawPages: List.generate(
                  _pages.length,
                  (index) => Center(
                    child: SizedBox(
                      width: MediaQuery.of(context).size.width - 64,
                      child: Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: _pages[index],
                        ),
                      ),
                    ),
                  ),
                ),
                done: const Text(
                  "Complete",
                  style: TextStyle(color: buttonColor),
                ),
                next: const Text(
                  "Proceed",
                  style: TextStyle(color: buttonColor),
                ),
                skip: const Text(
                  "Skip",
                  style: TextStyle(color: buttonColor),
                ),
                showSkipButton: true,
                nextFlex: 0,
                skipOrBackFlex: 0,
                globalBackgroundColor: Colors.transparent,
                isBottomSafeArea: true,
                dotsDecorator: DotsDecorator(
                  activeColor: buttonColor,
                  color: dotsColor,
                  activeShape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  activeSize: const Size(20, 9),
                  spacing: const EdgeInsets.all(5),
                ),
                onDone: () {},
              ),
            ),
          ],
        ),
      ),
    );
  }
}
