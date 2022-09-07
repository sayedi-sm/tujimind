import 'package:flutter/material.dart';

class ShelterCard {
  final String title;
  final String subtitle;
  final int memberCount;
  final Color color;

  ShelterCard(
      {required this.title,
      required this.subtitle,
      this.memberCount = 0,
      required this.color});
}
