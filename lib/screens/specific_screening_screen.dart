import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tujimind/constants.dart';
import 'package:tujimind/widgets/custom_button.dart';

class SpecificScreeningScreen extends StatefulWidget {
  static const String id = "SpecificScreeningScreen";

  const SpecificScreeningScreen({Key? key}) : super(key: key);

  @override
  State<SpecificScreeningScreen> createState() =>
      _SpecificScreeningScreenState();
}

class _SpecificScreeningScreenState extends State<SpecificScreeningScreen> {
  bool _isCardExpanded = false;
  bool _isCheckBoxSelected = false;
  List<String> _questions = [
    "Have you ever felt you ought to cut down on your drinking or drug use?",
    "have people annoyed you by criticizing your drinking or drug use?",
    "Have you felt bad or guilty about your drinking or drug use?",
    "Have you ever had a drink or used drugs first thing in the morning to steady your nerves or to get rid of a hangover (eye-opener)?",
  ];
  late List<bool> _questionChoices = List.filled(_questions.length, false);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildTujiAppBar("Substance & Alcohol Use Disorder"),
      backgroundColor: assessmentScreenColor,
      body: Column(
        children: [
          if (!_isCardExpanded)
            Padding(
              padding: EdgeInsets.all(16),
              child: Column(
                children: [
                  Image.asset(
                      "assets/images/substance_and_alcohol_illustration.png"),
                  SizedBox(
                    height: 16,
                  ),
                  Text(
                    "Finding out more about your specific symptoms can help "
                    "you find the treatment that specifically addresses "
                    "Your mental health.\n"
                    "The first step starts with completing the above questionnaire",
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.vertical(top: Radius.circular(32)),
                color: Colors.white,
              ),
              padding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
              child: Column(
                children: [
                  GestureDetector(
                    child: Container(
                      decoration: BoxDecoration(
                        color: assessmentScreenColor,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      margin: EdgeInsets.all(4),
                      height: 5,
                      width: 50,
                    ),
                    onTap: () {
                      setState(() {
                        _isCardExpanded = !_isCardExpanded;
                      });
                    },
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Text(
                    "Kindly fill in the right information to avoid misdiagnosis",
                    textAlign: TextAlign.center,
                  ),
                  Expanded(
                    child: ListView(
                      padding: EdgeInsets.symmetric(vertical: 8),
                      children: List.generate(
                        _questions.length,
                        (index) => CheckboxListTile(
                          value: _questionChoices[index],
                          onChanged: (value) {
                            setState(() {
                              _questionChoices[index] = value!;
                            });
                          },
                          title: Text(_questions[index]),
                        ),
                      ),
                    ),
                  ),
                  CustomButton(
                    child: Text("Submit"),
                    onPressed: _showSubmitDialog,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Checkbox(
                        value: _isCheckBoxSelected,
                        onChanged: (value) {
                          setState(() {
                            _isCheckBoxSelected = value!;
                          });
                        },
                        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      ),
                      Text("Send results to my email"),
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

  _showSubmitDialog() {
    return showDialog(
      context: context,
      builder: (context) => Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(18),
        ),
        child: Container(
          padding: EdgeInsets.all(16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                FontAwesomeIcons.solidCircleCheck,
                size: 100,
                color: tujiGreenColor,
              ),
              SizedBox(
                height: 16,
              ),
              Text(
                "Your test has been successfully submitted",
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: 16,
              ),
              CustomButton(child: Text("See Results"), onPressed: () {}),
            ],
          ),
        ),
      ),
    );
  }
}
