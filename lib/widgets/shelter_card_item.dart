import 'package:flutter/material.dart';
import 'package:tujimind/models/shelter_card.dart';

class ShelterCardItem extends StatelessWidget {
  const ShelterCardItem(this.shelterCard, {Key? key}) : super(key: key);

  final ShelterCard shelterCard;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: shelterCard.color,
      borderRadius: BorderRadius.circular(12),
      child: InkWell(
        onTap: () {},
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                shelterCard.title,
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
              Text(
                shelterCard.subtitle,
                maxLines: 3,
                softWrap: true,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 12,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
