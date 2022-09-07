import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tujimind/constants.dart';
import 'package:tujimind/models/therapist.dart';
import 'package:tujimind/widgets/custom_button.dart';

class TherapistDetailsScreen extends StatelessWidget {
  static const String id = "TherapistDetailsScreen";

  TherapistDetailsScreen({Key? key}) : super(key: key);
  late final Therapist therapist;

  @override
  Widget build(BuildContext context) {
    Map<String, dynamic> args = ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    therapist = args["therapist"];
    int index = args["index"];
    return Scaffold(
      appBar: buildTujiAppBar(therapist.name),
      body: Column(
        children: [
          Hero(
            tag: "therapist$index",
            child: FadeInImage(
              placeholder: AssetImage("assets/images/placeholder.png"),
              image: NetworkImage(therapist.imageUrl),
              fit: BoxFit.cover,
              height: 250,
              width: double.infinity,
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  Text(
                    therapist.title,
                    style: TextStyle(fontSize: 22),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Wrap(
                      spacing: 8,
                      children: List.generate(
                        5,
                        (index) => Icon(
                          index != 4
                              ? FontAwesomeIcons.solidStar
                              : FontAwesomeIcons.solidStarHalfStroke,
                          color: primaryColor,
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        color: assessmentScreenColor,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      margin: EdgeInsets.symmetric(vertical: 8),
                      child: ListView(
                        padding: EdgeInsets.all(16),
                        children: [
                          Text(
                            "Speciality",
                            style: TextStyle(fontSize: 20),
                          ),
                          SizedBox(
                            height: 8,
                          ),
                          RichText(
                            text: TextSpan(
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 16,
                              ),
                              text:
                                  "${therapist.details}\n\n${therapist.name}.\nCall or SMS ",
                              children: [
                                TextSpan(
                                  text: "${therapist.phone}",
                                  style: TextStyle(color: primaryColor),
                                ),
                                TextSpan(text: "\nEmail "),
                                TextSpan(
                                  text: "${therapist.email}",
                                  style: TextStyle(color: primaryColor),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  CustomButton(
                    child: Text("Book Appointment"),
                    onPressed: () {},
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
