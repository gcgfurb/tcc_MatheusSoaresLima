import 'package:flutter/material.dart';

class ErrorIndicator extends StatelessWidget {
  final String? message;

  ErrorIndicator({required this.message});

  @override
  Widget build(BuildContext context) {
    if (message == null) {
      return Container();
    } else {
      return Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: Colors.orange,
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              const Icon(
                Icons.warning_amber_outlined,
                color: Colors.white,
                size: 40,
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Text(
                  'Ops: $message. Por favor, tente novamente.',
                  style: const TextStyle(color: Colors.white, fontSize: 14),
                ),
              ),
            ],
          ),
        ),
      );
    }
  }
}
