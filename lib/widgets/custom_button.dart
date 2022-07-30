
import 'package:flutter/material.dart';

import '../constants.dart';

class CustomButton extends StatelessWidget {
  final Widget? child;
  final VoidCallback? onPressed;

  const CustomButton({Key? key, required this.child, required this.onPressed}) : super(key: key);



  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ButtonStyle(
        shape: MaterialStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        minimumSize: MaterialStateProperty.all(const Size(double.infinity, 50)),
        backgroundColor: MaterialStateProperty.all(buttonColor),
      ),
      child: child,
    );
  }
}
