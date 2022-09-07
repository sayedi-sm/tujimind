import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart' as intl;
import 'package:tujimind/constants.dart';
import 'package:tujimind/models/message.dart';
import 'package:tujimind/models/shelter_card.dart';
import 'package:tujimind/widgets/message_bubble.dart';
import 'package:tujimind/widgets/messages_dividing_line.dart';

class MessageScreen extends StatefulWidget {
  static const String id = "MessageScreen";

  MessageScreen({Key? key}) : super(key: key);

  @override
  State<MessageScreen> createState() => _MessageScreenState();
}

class _MessageScreenState extends State<MessageScreen> {
  List<Message> _messages = [
    Message(
      sender: "Strong Rambo",
      message:
          "I am really enjoying the discussions we are having on this new topic. "
          "Kindly make sure you give honest feedback guys.",
      sendTime: DateTime.now(),
    ),
    Message(
      sender: "Lonzo M.",
      message: "I am really intrigued by the thoughts @StrongRambo has. "
          "Maybe let's agree to disagree on matters budget.",
      sendTime: DateTime.now(),
      // sendTime: DateTime(2022, 8, 11, 23, 55),
    ),
    Message(
      sender: "Lonzo M.",
      message: "I am really intrigued by the thoughts @StrongRambo has. "
          "Maybe let's agree to disagree on matters budget.",
      sendTime: DateTime(2022, 4, 3, 15, 25),
    ),
    Message(
      sender: "Ahmad",
      message: "I am really intrigued by the thoughts @StrongRambo has. "
          "Maybe let's agree to disagree on matters budget.",
      sendTime: DateTime(2022, 8, 9, 19, 15),
    ),
    Message(
      sender: "Lonzo M.",
      message: "I am really intrigued by the thoughts @StrongRambo has. "
          "Maybe let's agree to disagree on matters budget.",
      sendTime: DateTime(2022, 8, 9, 5, 17),
    ),
    Message(
      sender: "Jamal",
      message: "I am really intrigued by the thoughts @StrongRambo has. "
          "Maybe let's agree to disagree on matters budget.",
      sendTime: DateTime(2022, 8, 9, 1, 43),
    ),
    Message(
      sender: "Lonzo M.",
      message: "I am really intrigued by the thoughts @StrongRambo has. "
          "Maybe let's agree to disagree on matters budget.",
      sendTime: DateTime(2021, 9, 9, 2, 47),
    ),
  ];

  // DateTime dateTime = DateTime.fromMillisecondsSinceEpoch(0);
  DateTime? dateTime;

  final TextEditingController _messageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    _messages.sort((a, b) => b.sendTime.compareTo(a.sendTime));
    final ShelterCard shelterCard =
        ModalRoute.of(context)!.settings.arguments as ShelterCard;

    return Scaffold(
      appBar: buildTujiAppBar(shelterCard.title,
          foregroundColor: shelterCard.color.computeLuminance() > 5
              ? Colors.black
              : Colors.white),
      backgroundColor: shelterCard.color,
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: Text(
              "${shelterCard.memberCount} Member${shelterCard.memberCount == 1 ? "" : "s"}",
              style: TextStyle(
                color: shelterCard.color.computeLuminance() > 5
                    ? Colors.black
                    : Colors.white,
              ),
            ),
          ),
          Expanded(
            child: Container(
              clipBehavior: Clip.hardEdge,
              decoration: BoxDecoration(
                color: appColor,
                borderRadius: BorderRadius.vertical(top: Radius.circular(32)),
              ),
              child: Column(
                children: [
                  Expanded(
                    child: ListView.builder(
                      padding:
                          const EdgeInsets.only(left: 16, top: 16, right: 16),
                      reverse: true,
                      keyboardDismissBehavior:
                          ScrollViewKeyboardDismissBehavior.onDrag,
                      itemCount: _messages.length,
                      itemBuilder: (ctx, index) {
                        final Message message = _messages[index];

                        var showMessagesDividingLine = false;
                        if ((index < _messages.length - 1 &&
                                trimDate(message.sendTime) !=
                                    trimDate(_messages[index + 1].sendTime)) ||
                            index == _messages.length - 1) {
                          showMessagesDividingLine = true;
                        }

                        return Column(
                          crossAxisAlignment: message.isRightAligned
                              ? CrossAxisAlignment.end
                              : CrossAxisAlignment.start,
                          children: [
                            if (showMessagesDividingLine)
                              MessagesDividingLine(
                                text: generateTimeString(message.sendTime),
                                color: shelterCard.color,
                              ),
                            MessageBubble(
                              message: message,
                              backgroundColor: shelterCard.color,
                            ),
                          ],
                        );
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16.0,
                      vertical: 4,
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Expanded(
                          child: TextField(
                            controller: _messageController,
                            cursorColor: shelterCard.color,
                            textCapitalization: TextCapitalization.sentences,
                            textDirection: intl.Bidi.detectRtlDirectionality(
                                    _messageController.text)
                                ? TextDirection.rtl
                                : TextDirection.ltr,
                            decoration: InputDecoration(
                              hintText: "Send message here",
                              contentPadding: EdgeInsets.all(12),
                              fillColor: cardBorderColor,
                              filled: true,
                              isDense: true,
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(32),
                                borderSide: BorderSide(color: cardBorderColor),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(32),
                                borderSide: BorderSide(color: cardBorderColor),
                              ),
                            ),
                            onChanged: (value) {
                              setState(() {});
                            },
                          ),
                        ),
                        IconButton(
                          onPressed: () {
                            setState(() {
                              if (_messageController.text.trim().isNotEmpty)
                                _messages.add(
                                  Message(
                                    sender: "Lonzo M.",
                                    message: _messageController.text,
                                    sendTime: DateTime.now(),
                                  ),
                                );
                              _messageController.clear();
                            });
                          },
                          icon: Icon(
                            FontAwesomeIcons.solidPaperPlane,
                            color: shelterCard.color,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  DateTime trimDate(DateTime dateTime) {
    return DateTime(dateTime.year, dateTime.month, dateTime.day);
  }

  String generateTimeString(DateTime dateTime) {
    dateTime = trimDate(dateTime);

    DateTime now = trimDate(DateTime.now());

    Duration difference = now.difference(dateTime);

    if (difference.inDays == 0) {
      return "Today";
    } else if (difference.inDays == 1) {
      return "Yesterday";
    } else if (difference.inDays < 7) {
      return intl.DateFormat.EEEE().format(dateTime);
    } else if (now.year == dateTime.year) {
      return intl.DateFormat.MMMd().format(dateTime);
    } else {
      return intl.DateFormat.yMMMd().format(dateTime);
    }
  }
}
