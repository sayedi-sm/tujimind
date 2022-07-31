import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tujimind/models/tuji_card.dart';

class TujiCardItem extends StatelessWidget {
  const TujiCardItem(this.tujiCard, {Key? key}) : super(key: key);

  final TujiCard tujiCard;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: tujiCard.onTap,
      child: AspectRatio(
        aspectRatio: 1,
        child: Ink(
          decoration: BoxDecoration(
            color: tujiCard.color,
            borderRadius: BorderRadius.circular(12),
          ),
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Icon(
                tujiCard.icon,
                size: 44,
                color: Colors.white,
              ),
              Flexible(
                child: Text(
                  tujiCard.title,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
