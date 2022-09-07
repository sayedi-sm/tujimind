import 'package:flutter/material.dart';

class MessagesDividingLine extends StatelessWidget {
  const MessagesDividingLine(
      {Key? key, required this.text, required this.color})
      : super(key: key);

  final String text;
  final Color color;
  final double _dividerThickness = 1;

  @override
  Widget build(BuildContext context) {
    var backgroundColor =
        HSLColor.fromColor(color).withLightness(0.9).toColor();
    return Row(
      children: [
        Expanded(
          child: Container(
            height: _dividerThickness,
            color: backgroundColor,
          ),
        ),
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(4),
            color: backgroundColor,
          ),
          padding: EdgeInsets.symmetric(
            horizontal: 12,
            vertical: 4,
          ),
          margin: EdgeInsets.symmetric(horizontal: 12, vertical: 4),
          child: Text(
            text,
            style: TextStyle(fontSize: 11, color: color),
          ),
        ),
        Expanded(
          child: Container(
            height: _dividerThickness,
            color: backgroundColor,
          ),
        ),
      ],
    );
  }
}
