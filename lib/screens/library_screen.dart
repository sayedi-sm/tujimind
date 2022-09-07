import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tujimind/constants.dart';
import 'package:tujimind/models/book.dart';
import 'package:tujimind/widgets/book_item.dart';
import 'package:tujimind/widgets/search_field.dart';
import 'package:tujimind/widgets/tuji_choice_chip.dart';

class LibraryScreen extends StatefulWidget {
  static const String id = "LibraryScreen";

  const LibraryScreen({Key? key}) : super(key: key);

  @override
  State<LibraryScreen> createState() => _LibraryScreenState();
}

class _LibraryScreenState extends State<LibraryScreen> {
  final List<Book> _books = [
    Book(
      title: "Panda Hizo Milima",
      author: "General Mathenge",
      pages: 220,
    ),
    Book(
      title: "Unlock Freedom",
      author: "Robert Ouko",
      pages: 239,
    ),
    Book(
      title: "Niliziba Ufa",
      author: "Omolo Kutoka Bonda",
      pages: 128,
    ),
    Book(
      title: "Furaha Sana",
      author: "Fayee Mjanjez",
      pages: 387,
    ),
  ];

  List<String> _choiceLabels = [
    "All",
    "Fiction",
    "Motivation",
    "Self Discipline"
  ];

  List<bool> _choiceStates = [false, true, false, false];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildTujiAppBar("Library"),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: SearchField(
              hintText: "Search audio & videos",
              color: tujiGreenColor,
            ),
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            padding: EdgeInsets.symmetric(vertical: 8, horizontal: 12),
            child: Row(
              children: List.generate(
                _choiceLabels.length,
                (index) => Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 4.0),
                  child: TujiChoiceChip(
                    label: _choiceLabels[index],
                    selected: _choiceStates[index],
                    color: tujiGreenColor,
                    onSelected: (value) {
                      setState(() {
                        _choiceStates[index] = value;
                      });
                    },
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            child: ListView(
              padding: EdgeInsets.symmetric(horizontal: 16),
              children: List.generate(
                _books.length,
                (index) => BookItem(_books[index]),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
