import 'package:flutter/material.dart';
import 'package:tujimind/widgets/custom_button.dart';

class BeginScreen extends StatelessWidget {
  const BeginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Image.asset("assets/images/begin_illustration.png"),
              const Padding(
                padding: EdgeInsets.all(16.0),
                child: Text(
                  "Don't worry, the information "
                  "you share will be used in the best "
                  "way to better your wellness",
                  style: TextStyle(fontSize: 20),
                  textAlign: TextAlign.center,
                ),
              ),
              CustomButton(
                child: const Text("Begin"),
                onPressed: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}
