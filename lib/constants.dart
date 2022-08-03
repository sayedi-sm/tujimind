import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

const appColor = Color(0xFFF9F9F9);
const textFieldFillColor = Color(0xFFEAEAEA);
const textFieldBorderColor = Color(0xFFB5B5B5);
const textFieldCursorColor = Color(0xFF525252);
const textFieldTitleColor = Color(0xFFA3A3A3);
const buttonColor = Color(0xFFED8356);
const assessmentScreenColor = Color(0xFFE6E8FA);
const dotsColor = Color(0xFFD4D4D4);
const activeBottomNavBarColor = Color(0xFF6F59F3);
const inactiveBottomNavBarColor = Color(0xFF77838F);

PreferredSizeWidget buildTujiAppBar(String title) {
  return AppBar(
    backgroundColor: Colors.transparent,
    elevation: 0,
    automaticallyImplyLeading: true,
    foregroundColor: Colors.black,
    title: Center(
      child: Text(title),
    ),
    actions: [
      IconButton(
        onPressed: () {},
        icon: Icon(
          FontAwesomeIcons.solidBell,
          size: 20,
        ),
      )
    ],
  );
}
