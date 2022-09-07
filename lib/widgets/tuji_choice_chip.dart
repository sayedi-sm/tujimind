import 'package:flutter/material.dart';
import 'package:tujimind/constants.dart';

class TujiChoiceChip extends StatelessWidget {
  final String label;
  final bool selected;
  final Color color;
  final void Function(bool)? onSelected;

  const TujiChoiceChip({
    Key? key,
    required this.label,
    required this.selected,
    required this.color,
    this.onSelected,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChoiceChip(
      padding: EdgeInsets.symmetric(horizontal: 16),
      label: Text(
        label,
        style: TextStyle(
          color: selected ? Colors.white : Colors.black,
        ),
      ),
      selected: selected,
      side: BorderSide(color: color),
      backgroundColor: Colors.transparent,
      selectedColor: color,
      onSelected: onSelected,
    );
  }
}
