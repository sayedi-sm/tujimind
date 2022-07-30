import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';
import 'package:tujimind/widgets/feed_message.dart';
import 'package:tujimind/widgets/tuji_card.dart';

import '../models/message.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<List<dynamic>> _tujiCardsData = [
    [
      "Screening",
      FontAwesomeIcons.personDotsFromLine,
      const Color(0xFF6F59F3),
    ],
    [
      "Find Therapist",
      FontAwesomeIcons.personBooth,
      const Color(0xFFED8356),
    ],
    [
      "Activities",
      FontAwesomeIcons.peopleRobbery,
      const Color(0xFF267DBD),
    ],
  ];

  final List<Message> _messages = [
    Message(
        sender: "Strong Rambo",
        message: "I am really enjoying the discussion we are having."
            "This is really a very good start to find the right way out of our situations"),
    Message(sender: "Khalligraph", message: "Quick fox jumps over the cat"),
    Message(
        sender: "23 Greatest",
        message: "Thanks for listening to my rants, love ya'll"),
    // Message(
    //     sender: "Strong Rambo",
    //     message: "I am really enjoying the discussion we are having."
    //         "This is really a very good start to find the right way out of our situations"),
    // Message(sender: "Khalligraph", message: "Quick fox jumps over the cat"),
    // Message(
    //     sender: "23 Greatest",
    //     message: "Thanks for listening to my rants, love ya'll"),
    // Message(
    //     sender: "Strong Rambo",
    //     message: "I am really enjoying the discussion we are having."
    //         "This is really a very good start to find the right way out of our situations"),
    // Message(sender: "Khalligraph", message: "Quick fox jumps over the cat"),
    // Message(
    //     sender: "23 Greatest",
    //     message: "Thanks for listening to my rants, love ya'll"),
    // Message(
    //     sender: "Strong Rambo",
    //     message: "I am really enjoying the discussion we are having."
    //         "This is really a very good start to find the right way out of our situations"),
    // Message(sender: "Khalligraph", message: "Quick fox jumps over the cat"),
    // Message(
    //     sender: "23 Greatest",
    //     message: "Thanks for listening to my rants, love ya'll"),
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Hi, Lonzo,",
            style: TextStyle(fontSize: 22),
          ),
          const SizedBox(
            height: 12,
          ),
          Text(
            DateFormat("E, d MMM").format(DateTime.now()),
            style: const TextStyle(color: Colors.grey),
          ),
          const SizedBox(
            height: 16,
          ),
          InkWell(
            onTap: () {},
            child: Stack(
              children: [
                Ink(
                  width: double.infinity,
                  height: 150,
                  decoration: BoxDecoration(
                    gradient: const LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [Color(0xFF6ADFAC), Color(0xFF44AE80)],
                    ),
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                Positioned(
                  bottom: 16,
                  left: 16,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                        "Choose Your Pathway to Wellness",
                        style: TextStyle(color: Colors.white, fontSize: 18),
                      ),
                      Text(
                        "Tune in your thoughts and feelings.",
                        style: TextStyle(color: Colors.white, fontSize: 12),
                      ),
                    ],
                  ),
                ),
                const Positioned(
                  right: 16,
                  top: 0,
                  bottom: 0,
                  child: CircleAvatar(
                    backgroundColor: Colors.white,
                    child: Icon(
                      Icons.arrow_forward,
                      color: Color(0xFF44AE80),
                    ),
                  ),
                ),
              ],
            ),
          ),
          GridView(
            padding: const EdgeInsets.symmetric(vertical: 16),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisSpacing: 12,
              crossAxisCount: 3,
            ),
            shrinkWrap: true,
            children: List.generate(
              _tujiCardsData.length,
              (index) => TujiCard(
                title: _tujiCardsData[index][0],
                icon: _tujiCardsData[index][1],
                color: _tujiCardsData[index][2],
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(top: 16, bottom: 16.0),
            child: Text(
              "Feed from My Shelter",
              style: TextStyle(fontSize: 16),
            ),
          ),
          Expanded(
            child: ListView.separated(
              itemCount: _messages.length,
              itemBuilder: (ctx, index) => FeedMessage(_messages[index]),
              separatorBuilder: (ctx, int index) => const SizedBox(height: 12),
            ),
          ),
        ],
      ),
    );
  }
}
