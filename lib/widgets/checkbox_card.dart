import 'package:flutter/material.dart';

class CheckboxCard extends StatefulWidget {
  final String title;
  final List<String> list;

  const CheckboxCard({Key? key, required this.title, required this.list,}) : super(key: key);

  @override
  State<CheckboxCard> createState() => _CheckboxCardState();
}

class _CheckboxCardState extends State<CheckboxCard> {

  late final List<bool> _selected = List.filled(widget.list.length, false);

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
          (index) => CheckboxListTile(
            value: _selected[index],
            title: Text(widget.list[index]),
            controlAffinity: ListTileControlAffinity.trailing,
            onChanged: (value) {
              setState(() {
                _selected[index] = value!;
              });
            },
          ),
        ),
      ],
    );
  }
}
