import 'package:flutter/material.dart';

class TujiCard {
  final String title;
  final IconData icon;
  final Color color;
  final VoidCallback onTap;

  TujiCard({
    required this.title,
    required this.icon,
    required this.color,
    required this.onTap,
  });
}
