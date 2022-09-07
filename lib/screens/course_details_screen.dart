import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tujimind/constants.dart';
import 'package:tujimind/models/course_card.dart';
import 'package:tujimind/models/tuji_stepper.dart';

class CourseDetailsScreen extends StatefulWidget {
  static const String id = "CourseDetailsScreen";

  const CourseDetailsScreen({Key? key}) : super(key: key);

  @override
  State<CourseDetailsScreen> createState() => _CourseDetailsScreenState();
}

class _CourseDetailsScreenState extends State<CourseDetailsScreen> {
  int currentStep = 0;

  List<List<String>> _stepData = [
    [
      "Morning breathing exercises",
      "Breathe in, breathe out, breathe in again, let it happen and watch!",
    ],
    [
      "Short break from work and a breath",
      "Breathe in, breathe out, breathe in again, let it happen and go outside",
    ],
    [
      "Relaxation",
      "Breathe in, breathe out, breathe in again, let it happen for the happy place",
    ],
    [
      "This is the Remix bruh",
      "Breathe in, breathe out, breathe in again, let it happen",
    ],
    [
      "This is a very new step to follow up to the space where",
      "Breathe in, breathe out, breathe in again, let it happen",
    ],
    [
      "The last step to follow is here!",
      "Go outside for a full experience!",
    ],
  ];

  List<TujiStep> _buildSteps() {
    return List.generate(
      _stepData.length,
      (index) => TujiStep(
        title: _stepData[index][0],
        subtitle: _stepData[index][1],
        isActive: currentStep >= index,
        state: currentStep == index
            ? TujiStepState.iconified
            : currentStep < index
                ? TujiStepState.disabled
                : TujiStepState.complete,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    CourseCard courseCard =
        ModalRoute.of(context)!.settings.arguments as CourseCard;

    return Scaffold(
      appBar: buildTujiAppBar("Courses"),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 150,
              width: double.infinity,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: FadeInImage.assetNetwork(
                  placeholder: "assets/images/placeholder2.jpg",
                  image: courseCard.imageUrl,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(
              height: 8,
            ),
            Text(
              courseCard.title,
              style: TextStyle(fontSize: 18),
            ),
            RatingBar.builder(
              itemSize: 24,
              itemPadding: EdgeInsets.symmetric(vertical: 8),
              unratedColor: tujiDarkOrangeColor,
              ignoreGestures: true,
              itemBuilder: (context, index) => Padding(
                padding: const EdgeInsets.only(right: 4),
                child: Icon(FontAwesomeIcons.solidStar),
              ),
              onRatingUpdate: (index) {},
            ),
            Text(
              "By: ${courseCard.by}",
              style: TextStyle(color: tujiGreyColor),
            ),
            SizedBox(
              height: 8,
            ),
            Text(courseCard.description),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Text(
                "Your Progress",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            Expanded(
              child: TujiStepper(
                steps: _buildSteps(),
                currentStep: currentStep,
                onStepTapped: (index) {
                  setState(() {
                    currentStep = index;
                  });
                },
                onStepContinue: () {
                  if (currentStep < _stepData.length) {
                    setState(() {
                      currentStep++;
                    });
                  }
                },
                onStepCancel: () {
                  if (currentStep > 0) {
                    setState(() {
                      currentStep--;
                    });
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
