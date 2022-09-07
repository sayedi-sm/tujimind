import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tujimind/screens/main_screen.dart';
import 'package:tujimind/screens/message_screen.dart';
import 'package:tujimind/widgets/shelter_card_item.dart';

import '../constants.dart';
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
      memberCount: 14789,
      color: tujiLightBlueColor,
    ),
    ShelterCard(
      title: "Alcoholic Anonymous",
      subtitle: "Discuss with peers & ask "
          "questions on how to survive "
          "and quit alcohol dependence.",
      color: tujiDarkOrangeColor,
    ),
    ShelterCard(
      title: "For Eating Disorder",
      subtitle: "Discuss with peers & ask "
          "questions on how to survive "
          "depression/Attention deficit "
          "Hyperactivity disorder.",
      color: tujiGreenColor,
    ),
    ShelterCard(
      title: "For PTSD",
      subtitle: "Discuss with peers & ask "
          "questions on how to survive "
          "PostTraumatic Stress "
          "Disorder.",
      memberCount: 1,
      color: const Color(0xFF267DBD),
    ),
    ShelterCard(
      title: "For ADHD",
      subtitle: "Discuss with peers & ask "
          "questions on how to survive "
          "depression/Attention deficit "
          "Hyperactivity disorder.",
      color: tujiRedColor,
    ),
    ShelterCard(
      title: "For Anxiety",
      subtitle: "Discuss with peers & ask "
          "questions on how to survive "
          "Anxiety Stress "
          "Disorder.",
      color: tujiGreyColor,
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
              itemBuilder: (ctx, index) => ShelterCardItem(
                _shelterCardList[index],
                () => Navigator.of(MainScreen.universalContext!)
                    .pushNamed(MessageScreen.id, arguments: _shelterCardList[index]),
              ),
              itemCount: _shelterCardList.length,
              shrinkWrap: true,
            ),
          ),
        ],
      ),
    );
  }
}
