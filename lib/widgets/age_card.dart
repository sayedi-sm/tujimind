import 'package:flutter/material.dart';
import 'package:numberpicker/numberpicker.dart';


class AgeCard extends StatefulWidget {
  final String title;

  const AgeCard({Key? key, required this.title}) : super(key: key);

  @override
  State<AgeCard> createState() => _AgeCardState();
}

class _AgeCardState extends State<AgeCard> {
  int currentValue = 18;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          widget.title,
          style: const TextStyle(fontSize: 20),
          textAlign: TextAlign.center,
        ),
        const SizedBox(
          height: 12,
        ),
        NumberPicker(
          minValue: 12,
          maxValue: 65,
          value: currentValue,
          onChanged: (value) {
            setState(() {
              currentValue = value;
            });
          },
        ),
      ],
    );
  }
}
