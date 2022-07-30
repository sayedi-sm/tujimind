import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SpeakScreen extends StatefulWidget {
  const SpeakScreen({Key? key}) : super(key: key);

  @override
  State<SpeakScreen> createState() => _SpeakScreenState();
}

class _SpeakScreenState extends State<SpeakScreen> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Material(
        color: Colors.deepPurpleAccent,
        borderRadius: BorderRadius.circular(18),
        child: InkWell(
          onTap: () {},
          borderRadius: BorderRadius.circular(18),
          child: Container(
            width: 150,
            height: 100,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.red, width: 2),
              borderRadius: BorderRadius.circular(18),
              color: Colors.transparent,
            ),
            clipBehavior: Clip.hardEdge,
            child: const Center(
              child: Text(
                "A box container",
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

/*
Center(
      child: Container(
        width: 150,
        height: 100,
        decoration: BoxDecoration(
          border: Border.all(color: Colors.red, width: 2),
          borderRadius: BorderRadius.circular(18),
          color: Colors.transparent,
        ),
        clipBehavior: Clip.hardEdge,
        child: Material(
          color: Colors.deepPurpleAccent,
          child: InkWell(
            onTap: () {},
            child: Center(
              child: Text(
                "A box container",
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
        ),
      ),
    );
 */