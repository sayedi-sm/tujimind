import 'package:flutter/material.dart';

import '../constants.dart';

class CustomTextField extends StatelessWidget {
  String title;
  Widget? prefixIcon;
  Widget? suffixIcon;
  TextInputType? keyboardType;
  bool obscureText;
  String obscuringCharacter;
  String? hintText;
  TextCapitalization textCapitalization;
  String Function(String?)? validator;
  Function(String)? onChanged;
  Function(String?)? onSaved;
  Function(String)? onFieldSubmitted;
  TextInputAction? textInputAction;
  TextEditingController? controller;

  FocusNode filedNode = FocusNode();

  CustomTextField({
    Key? key,
    required this.title,
    this.prefixIcon,
    this.suffixIcon,
    this.keyboardType,
    this.obscureText = false,
    this.obscuringCharacter = "•",
    this.hintText,
    this.textCapitalization = TextCapitalization.none,
    this.validator,
    this.onChanged,
    this.onSaved,
    this.onFieldSubmitted,
    this.textInputAction,
    this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(color: textFieldTitleColor),
        ),
        const SizedBox(
          height: 4,
        ),
        TextFormField(
          focusNode: filedNode,
          cursorColor: textFieldCursorColor,
          keyboardType: keyboardType,
          obscureText: obscureText,
          obscuringCharacter: obscuringCharacter,
          textCapitalization: textCapitalization,
          validator: validator,
          onChanged: onChanged,
          onSaved: onSaved,
          onFieldSubmitted: onFieldSubmitted,
          textInputAction: textInputAction,
          controller: controller,
          decoration: InputDecoration(
            prefixIcon: prefixIcon,
            suffixIcon: suffixIcon,
            filled: true,
            fillColor: textFieldFillColor,
            hintText: hintText,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16),
              borderSide: BorderSide.none,
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16),
              borderSide: const BorderSide(color: tujiGreyColor),
            ),
          ),
        ),
        const SizedBox(
          height: 12,
        ),
      ],
    );
  }
}
