import 'package:flutter/material.dart';
import 'package:tujimind/models/self_help_card.dart';

class SelfHelpCardItem extends StatelessWidget {
  const SelfHelpCardItem(this.selfHelpCard, {Key? key}) : super(key: key);

  final SelfHelpCard selfHelpCard;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Ink(
        decoration: BoxDecoration(
          color: selfHelpCard.color,
          borderRadius: BorderRadius.circular(12),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 28),
        child: Row(
          children: [
            Icon(
              selfHelpCard.icon,
              color: Colors.white,
              size: 42,
            ),
            const SizedBox(
              width: 28,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    selfHelpCard.title,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    selfHelpCard.subtitle,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(color: Colors.white, fontSize: 12),
                    maxLines: 2,
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
