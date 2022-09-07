import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tujimind/constants.dart';
import 'package:tujimind/screens/courses_screen.dart';
import 'package:tujimind/screens/main_screen.dart';
import 'package:tujimind/screens/media_catalogue_screen.dart';
import 'package:tujimind/widgets/self_help_card_item.dart';

import '../models/self_help_card.dart';
import 'course_details_screen.dart';
import 'library_screen.dart';

class SelfHelpScreen extends StatefulWidget {
  const SelfHelpScreen({Key? key}) : super(key: key);

  @override
  State<SelfHelpScreen> createState() => _SelfHelpScreenState();
}

class _SelfHelpScreenState extends State<SelfHelpScreen> {
  late final List<SelfHelpCard> _items = [
    SelfHelpCard(
      title: "Find Peer Group",
      subtitle:
          "Discuss with peers & ask questions on how to survive depression.",
      icon: FontAwesomeIcons.peopleCarryBox,
      color: tujiLightBlueColor,
    ),
    SelfHelpCard(
      title: "Access Library",
      subtitle: "Pick from a variety of readable content to learn from.",
      icon: FontAwesomeIcons.book,
      color: tujiGreenColor,
      onTap: () => Navigator.of(MainScreen.universalContext!).pushNamed(LibraryScreen.id),
    ),
    SelfHelpCard(
      title: "Access Media Catalogue",
      subtitle: "Pick from a variety of video and audio content "
          "to learn from.",
      icon: FontAwesomeIcons.play,
      color: tujiRedColor,
      onTap: () => Navigator.of(MainScreen.universalContext!).pushNamed(MediaCatalogueScreen.id),
    ),
    SelfHelpCard(
      title: "Courses",
      subtitle: "Find free and paid for courses, brought to "
          "you by the world's best training partners",
      icon: FontAwesomeIcons.clipboardList,
      color: tujiGreyColor,
      onTap: () => Navigator.of(MainScreen.universalContext!).pushNamed(CoursesScreen.id),
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
      color: tujiDarkOrangeColor,
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
