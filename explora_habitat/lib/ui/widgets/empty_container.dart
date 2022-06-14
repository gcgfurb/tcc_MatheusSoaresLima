import 'package:flutter/material.dart';

class EmptyContainer extends StatelessWidget {
  final String content;

  EmptyContainer(this.content);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 20),
      width: 200,
      height: 100,
      child: Center(
        child: Column(
          children: [
            const Icon(
              Icons.not_interested_outlined,
              color: Colors.teal,
              size: 40,
            ),
            Text(
              content,
              textAlign: TextAlign.center,
              style: const TextStyle(color: Colors.teal, fontSize: 15),
            )
          ],
        ),
      ),
    );
  }
}
