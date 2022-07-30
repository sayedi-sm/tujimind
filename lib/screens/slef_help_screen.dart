import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tujimind/widgets/self_help_card_item.dart';

import '../models/self_help_card.dart';

class SelfHelpScreen extends StatefulWidget {
  const SelfHelpScreen({Key? key}) : super(key: key);

  @override
  State<SelfHelpScreen> createState() => _SelfHelpScreenState();
}

class _SelfHelpScreenState extends State<SelfHelpScreen> {
  final List<SelfHelpCard> _items = [
    SelfHelpCard(
      title: "Find Peer Group",
      subtitle:
          "Discuss with peers & ask questions on how to survive depression.",
      icon: FontAwesomeIcons.peopleCarryBox,
      color: const Color(0xFF7E88E3),
    ),
    SelfHelpCard(
      title: "Access Library",
      subtitle: "Pick from a variety of readable content to learn from.",
      icon: FontAwesomeIcons.book,
      color: const Color(0xFF44AE80),
    ),
    SelfHelpCard(
      title: "Access Media Catalogue",
      subtitle: "Pick from a variety of video and audio content "
          "to learn from.",
      icon: FontAwesomeIcons.play,
      color: const Color(0xFFD87979),
    ),
    SelfHelpCard(
      title: "Course",
      subtitle: "Find free and paid for courses, brought to "
          "you by the world's best training partners",
      icon: FontAwesomeIcons.clipboardList,
      color: const Color(0xFFB7B7B7),
    ),
    SelfHelpCard(
      title: "Motivation",
      subtitle: "Pick from a variety of video and audio content "
          "to relax & meditate on",
      icon: FontAwesomeIcons.umbrellaBeach,
      color: const Color(0xFF267DBD),
    ),
    SelfHelpCard(
      title: "Activities",
      subtitle: "Pick from a variety of video and audio content "
          "to relax & meditate on",
      icon: FontAwesomeIcons.peopleRobbery,
      color: const Color(0xFFE3693F),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: ListView.separated(
        itemBuilder: (ctx, index) => SelfHelpCardItem(_items[index]),
        separatorBuilder: (ctx, index) => const SizedBox(height: 8),
        itemCount: _items.length,
      ),
    );
  }
}
