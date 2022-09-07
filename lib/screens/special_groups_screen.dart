import 'package:flutter/material.dart';
import 'package:tujimind/constants.dart';
import 'package:tujimind/widgets/shelter_card_item.dart';

import '../models/shelter_card.dart';

class SpecialGroupsScreen extends StatelessWidget {
  static const String id = "SpecialGroupsScreen";

  SpecialGroupsScreen({Key? key}) : super(key: key);

  final List<ShelterCard> _specialGroupList = [
    ShelterCard(
      title: "For Patients with Chronic Illness",
      subtitle: "Discuss with peers & ask "
          "questions on how to survive "
          "depression.",
      color: const Color(0xFF7E88E3),
    ),
    ShelterCard(
      title: "For Members of the Special Forces",
      subtitle: "Discuss with peers & ask "
          "questions on how to survive "
          "and quit alcohol dependence.",
      color: const Color(0xFFE3693F),
    ),
    ShelterCard(
      title: "For GBV Victims",
      subtitle: "Discuss with peers & ask "
          "questions on how to survive "
          "depression/Attention deficit "
          "Hyperactivity disorder.",
      color: const Color(0xFF44AE80),
    ),
    ShelterCard(
      title: "For Single Parents",
      subtitle: "Discuss with peers & ask "
          "questions on how to survive "
          "PostTraumatic Stress "
          "Disorder.",
      color: const Color(0xFF267DBD),
    ),
    ShelterCard(
      title: "Relapse Prevention",
      subtitle: "Discuss with peers & ask "
          "questions on how to survive "
          "depression/Attention deficit "
          "Hyperactivity disorder.",
      color: const Color(0xFFD87979),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildTujiAppBar("Special Groups"),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            Image.asset("assets/images/special_groups_illustration.png"),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                "Pick a group of special care members if you belong to one.",
                textAlign: TextAlign.center,
              ),
            ),
            Expanded(
              child: GridView(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 8,
                  mainAxisSpacing: 8,
                ),
                children: List.generate(
                  _specialGroupList.length,
                  (index) => ShelterCardItem(_specialGroupList[index], (){}),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
