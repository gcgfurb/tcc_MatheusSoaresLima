import 'package:flutter/material.dart';
import 'package:explora_habitat/constants/constants_style.dart';
import 'package:flutter/services.dart';

class CustomFormField extends StatelessWidget {
  final String? labelText;
  final String? errorText;
  final TextInputType inputType;
  final Function(String value) onChanged;
  final bool obscure;
  final bool enabled;
  final Color textColor;
  final String? initialValue;
  final TextEditingController? controller;
  final List<TextInputFormatter>? inputFormatters;
  final Widget? sufixIcon;
  final int maxLength;
  final String? counterText;

  CustomFormField({
    this.labelText,
    required this.errorText,
    required this.inputType,
    required this.onChanged,
    this.initialValue,
    this.controller,
    this.textColor = Colors.black,
    this.obscure = false,
    this.enabled = true,
    this.inputFormatters,
    this.sufixIcon,
    this.maxLength = 50,
    this.counterText,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 3, bottom: 4, top: 8),
      child: TextFormField(
        enabled: enabled,
        initialValue: initialValue,
        controller: controller,
        onChanged: onChanged,
        keyboardType: inputType,
        obscureText: obscure,
        inputFormatters: inputFormatters,
        style: TextStyle(color: textColor),
        minLines: 1,
        maxLines: obscure ? 1 : 5,
        maxLength: maxLength,
        decoration: InputDecoration(
          counterText: counterText,
          suffixIcon: sufixIcon,
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
