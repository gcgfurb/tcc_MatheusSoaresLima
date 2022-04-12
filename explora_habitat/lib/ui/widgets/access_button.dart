import 'package:flutter/material.dart';
import 'package:explora_habitat/constants/constants_colors.dart';

class AccessButton extends StatelessWidget {
  final Function()? onPressed;
  final String title;
  final bool loading;

  AccessButton({
    required this.title,
    required this.onPressed,
    required this.loading,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 32, right: 32),
      height: 50,
      child: MaterialButton(
        disabledColor: green.withAlpha(120),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
        color: green,
        child: loading
            ? const CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation(Colors.white),
              )
            : Text(title, style: const TextStyle(fontSize: 18)),
        textColor: Colors.white,
        elevation: 0,
        onPressed: onPressed,
      ),
    );
  }
}
