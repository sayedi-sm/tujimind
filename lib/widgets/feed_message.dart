import 'package:flutter/material.dart';
import 'package:tujimind/models/message.dart';

class FeedMessage extends StatelessWidget {
  const FeedMessage(this.message, {Key? key}) : super(key: key);
  final Message message;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: const Color(0xFFF4F2FF),
      borderRadius: BorderRadius.circular(12),
      child: InkWell(
        borderRadius: BorderRadius.circular(12),
        onTap: () {},
        child: Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            border: Border.all(color: const Color(0xFFE3E3E3)),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: const Color(0xFFEAE7FC),
                  border: Border.all(color: const Color(0xFF6F59F3)),
                ),
                padding: const EdgeInsets.all(8),
                child: Text(
                  message.sender[0],
                  style: const TextStyle(
                    color: Color(0xFF6F59F3),
                  ),
                ),
              ),
              const SizedBox(
                width: 8,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      message.sender,
                      style: const TextStyle(fontSize: 16),
                    ),
                    Text(
                      message.message,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(color: Color(0xFF77838F)),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
