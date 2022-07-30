import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tujimind/widgets/shelter_card_item.dart';

import '../models/shelter_card.dart';

class ShelterScreen extends StatefulWidget {
  const ShelterScreen({Key? key}) : super(key: key);

  @override
  State<ShelterScreen> createState() => _ShelterScreenState();
}

class _ShelterScreenState extends State<ShelterScreen> {
  final List<ShelterCard> _shelterCardList = [
    ShelterCard(
      title: "For Depression",
      subtitle: "Discuss with peers & ask "
          "questions on how to survive "
          "depression.",
      color: const Color(0xFF7E88E3),
    ),
    ShelterCard(
      title: "Alcoholic Anonymous",
      subtitle: "Discuss with peers & ask "
          "questions on how to survive "
          "and quit alcohol dependence.",
      color: const Color(0xFFE3693F),
    ),
    ShelterCard(
      title: "For Eating Disorder",
      subtitle: "Discuss with peers & ask "
          "questions on how to survive "
          "depression/Attention deficit "
          "Hyperactivity disorder.",
      color: const Color(0xFF44AE80),
    ),
    ShelterCard(
      title: "For PTSD",
      subtitle: "Discuss with peers & ask "
          "questions on how to survive "
          "PostTraumatic Stress "
          "Disorder.",
      color: const Color(0xFF267DBD),
    ),
    ShelterCard(
      title: "For ADHD",
      subtitle: "Discuss with peers & ask "
          "questions on how to survive "
          "depression/Attention deficit "
          "Hyperactivity disorder.",
      color: const Color(0xFFD87979),
    ),
    ShelterCard(
      title: "For PTSD",
      subtitle: "Discuss with peers & ask "
          "questions on how to survive "
          "PostTraumatic Stress "
          "Disorder.",
      color: const Color(0xFFB7B7B7),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        children: [
          Image.asset("assets/images/shelter_illustration.png"),
          const Padding(
            padding: EdgeInsets.all(16.0),
            child: Text(
              "Pick a group of special care members if you belong to one.",
              style: TextStyle(fontSize: 16),
              textAlign: TextAlign.center,
            ),
          ),
          Expanded(
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
              ),
              itemBuilder: (ctx, index) =>
                  ShelterCardItem(_shelterCardList[index]),
              itemCount: _shelterCardList.length,
              shrinkWrap: true,
            ),
          ),
        ],
      ),
    );
  }
}
