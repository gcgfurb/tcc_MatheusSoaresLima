import 'package:flutter/material.dart';
import 'package:explora_habitat/constants/constants_style.dart';

class CustomFormField extends StatelessWidget {
  final String? labelText;
  final String? errorText;
  final TextInputType inputType;
  final Function(String value) onChanged;
  final bool obscure;
  final Color textColor;
  final TextEditingController? controller;

  CustomFormField({
    this.labelText,
    required this.errorText,
    required this.inputType,
    required this.onChanged,
    this.controller,
    this.textColor = Colors.black,
    this.obscure = false,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 3, bottom: 4, top: 8),
      child: TextFormField(
        controller: controller,
        onChanged: onChanged,
        keyboardType: inputType,
        obscureText: obscure,
        style: TextStyle(color: textColor),
        decoration: InputDecoration(
          labelText: labelText,
          labelStyle: kLabelStyle.copyWith(color: textColor),
          contentPadding: kContentPadding,
          errorText: errorText,
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: textColor),
          ),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: textColor),
          ),
        ),
      ),
    );
  }
}
