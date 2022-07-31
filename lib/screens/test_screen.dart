import 'package:flutter/material.dart';

class TestScreen extends StatelessWidget {
  const TestScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Row(
            children: [
              Container(width: 100, height: 100, color: Colors.grey,),
              Flexible(
                child: Wrap(
                  children: [
                    Chip(
                      label: Text("A small chip"),
                    ),
                    Chip(label: Text("A medium sized chip"),),
                    Chip(label: Text("A very very lage sized chip"),),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
