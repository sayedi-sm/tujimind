import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tujimind/constants.dart';

import '../models/book.dart';

class BookItem extends StatelessWidget {
  const BookItem(this.book, {Key? key}) : super(key: key);

  final Book book;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 8),
      padding: EdgeInsets.all(4),
      height: 120,
      decoration: BoxDecoration(
        color: cardFillColor,
        border: Border.all(color: cardBorderColor),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          Container(
            width: 100,
            height: 100,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: Colors.teal,
            ),
          ),
          SizedBox(
            width: 16,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                book.title,
                style: TextStyle(fontSize: 18),
              ),
              Text(
                "Author: ${book.author}",
                style: TextStyle(color: tujiDarkGreyColor),
              ),
              Spacer(),
              Flexible(
                child: Row(
                  children: [
                    Icon(
                      FontAwesomeIcons.bookOpen,
                      size: 14,
                      color: tujiDarkGreyColor,
                    ),
                    SizedBox(width: 8),
                    Text(
                      "${book.pages} pages",
                      style: TextStyle(
                        fontSize: 12,
                        color: tujiDarkGreyColor,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
