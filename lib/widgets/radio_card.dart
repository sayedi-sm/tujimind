import 'package:flutter/material.dart';

class RadioCard extends StatefulWidget {
  final String title;
  final List<String> list;

  const RadioCard({
    Key? key,
    required this.title,
    required this.list,
  }) : super(key: key);

  @override
  State<RadioCard> createState() => _RadioCardState();
}

class _RadioCardState extends State<RadioCard> {
  int _groupValue = 0;

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
        ...List.generate(
          widget.list.length,
          (index) => RadioListTile(
            value: index,
            groupValue: _groupValue,
            title: Text(widget.list[index]),
            controlAffinity: ListTileControlAffinity.trailing,
            onChanged: (value) {
              setState(() {
                _groupValue = value as int;
              });
            },
          ),
        ),
      ],
    );
  }
}
