import 'package:flutter/material.dart';
import 'package:tujimind/models/activity.dart';

class ActivityItem extends StatelessWidget {
  final Activity activity;

  const ActivityItem(this.activity, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
      ),
      clipBehavior: Clip.hardEdge,
      child: Stack(
        children: [
          FadeInImage(
            placeholder: AssetImage("assets/images/placeholder2.jpg"),
            image: NetworkImage(activity.imageUrl),
            fit: BoxFit.cover,
          ),
          Align(
            alignment: Alignment.bottomLeft,
            child: Container(
              color: Colors.black.withOpacity(0.5),
              width: double.infinity,
              padding: EdgeInsets.all(8),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    activity.title,
                    style: TextStyle(
                        color: Colors.white, fontSize: 16, letterSpacing: 1),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  Text(
                    activity.subtitle,
                    style: TextStyle(color: Colors.white, fontSize: 12),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  Text(
                    "${activity.members} members",
                    style: TextStyle(color: Colors.white, fontSize: 11),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
