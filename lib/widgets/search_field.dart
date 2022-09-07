import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../constants.dart';

class SearchField extends StatelessWidget {
  final String? hintText;
  final Color color;
  final void Function(String)? onChanged;

  const SearchField({
    Key? key,
    this.hintText,
    required this.color,
    this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        contentPadding: EdgeInsets.symmetric(horizontal: 8),
        prefixIcon: Icon(
          FontAwesomeIcons.magnifyingGlass,
          color: color,
        ),
        hintText: hintText,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(32),
          borderSide: BorderSide(color: color),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(32),
          borderSide: BorderSide(color: color),
        ),
      ),
      cursorColor: color,
      onChanged: onChanged,
    );
  }
}
