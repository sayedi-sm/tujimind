import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

const appColor = Color(0xFFF9F9F9);
const tujiLightBlueColor = Color(0xFF7E88E3);
const tujiDarkOrangeColor = Color(0xFFE3693F);
const tujiGreenColor = Color(0xFF44AE80);
const tujiRedColor = Color(0xFFD87979);
const tujiGreyColor = Color(0xFFB7B7B7);
const tujiDarkGreyColor = Color(0xFF77838F);
const textFieldFillColor = Color(0xFFEAEAEA);
const textFieldCursorColor = Color(0xFF525252);
const textFieldTitleColor = Color(0xFFA3A3A3);
const primaryColor = Color(0xFFED8356);
const assessmentScreenColor = Color(0xFFE6E8FA);
const dotsColor = Color(0xFFD4D4D4);
const activeBottomNavBarColor = Color(0xFF6F59F3);
const cardFillColor = Color(0xFFF4F2FF);
const cardBorderColor = Color(0xFFE3E3E3);

PreferredSizeWidget buildTujiAppBar(String title, {Color? foregroundColor}) {
  return AppBar(
    backgroundColor: Colors.transparent,
    elevation: 0,
    automaticallyImplyLeading: true,
    foregroundColor: foregroundColor ?? Colors.black,
    centerTitle: true,
    title: Text(title),
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
