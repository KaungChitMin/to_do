import 'package:flutter/material.dart';

class TextFormFieldWidget extends StatelessWidget {
  const TextFormFieldWidget(
      {Key? key,
      required this.maxLines,
      required this.hintText,
      required this.requiredDigit,
      required this.invalidText,
      required this.icon})
      : super(key: key);

  final int maxLines;
  final String hintText;
  final int requiredDigit;
  final String invalidText;
  final Icon icon;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: true,
      maxLines: maxLines,
      decoration: InputDecoration(
          prefixIcon: icon,
          hintText: hintText,
          enabledBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.blueGrey)),
          focusedBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.blueGrey)),
          contentPadding: const EdgeInsets.symmetric(vertical: 15)),
      validator: (text) {
        if ((text?.length ?? 0) < requiredDigit) {
          return invalidText;
        }
        return null;
      },
    );
  }
}
