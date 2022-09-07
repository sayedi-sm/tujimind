import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../models/message.dart';

class MessageBubble extends StatefulWidget {
  const MessageBubble(
      {Key? key, required this.message, required this.backgroundColor})
      : super(key: key);

  final Message message;
  final Color backgroundColor;

  @override
  State<MessageBubble> createState() => _MessageBubbleState();
}

class _MessageBubbleState extends State<MessageBubble> {
  bool _showTimePart = false;
  final double _bubbleBorderRadius = 18;

  @override
  Widget build(BuildContext context) {
    var backgroundColor = widget.message.sender == "Lonzo M."
        ? widget.backgroundColor
        : HSLColor.fromColor(widget.backgroundColor)
            .withLightness(0.9)
            .toColor();
    var luminance = backgroundColor.computeLuminance();
    return GestureDetector(
      onTap: () {
        setState(() {
          _showTimePart = !_showTimePart;
        });
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: Column(
          crossAxisAlignment: widget.message.isRightAligned
              ? CrossAxisAlignment.end
              : CrossAxisAlignment.start,
          children: [
            Container(
              decoration: BoxDecoration(
                color: backgroundColor,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(_bubbleBorderRadius),
                  topRight: Radius.circular(_bubbleBorderRadius),
                  bottomRight: widget.message.isRightAligned
                      ? Radius.zero
                      : Radius.circular(_bubbleBorderRadius),
                  bottomLeft: widget.message.isRightAligned
                      ? Radius.circular(_bubbleBorderRadius)
                      : Radius.zero,
                ),
              ),
              constraints: BoxConstraints(
                maxWidth: MediaQuery.of(context).size.width - 50,
              ),
              padding: EdgeInsets.all(8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.message.sender,
                    style: TextStyle(
                      color: luminance > 0.5 ? Colors.black : Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    widget.message.message,
                    style: TextStyle(
                      color: luminance > 0.5 ? Colors.black : Colors.white,
                    ),
                  ),
                ],
              ),
            ),
            if (_showTimePart)
              Text(
                DateFormat.jm().format(widget.message.sendTime),
                style: TextStyle(fontSize: 11),
              ),
          ],
        ),
      ),
    );
  }
}
