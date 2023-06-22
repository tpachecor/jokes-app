import 'package:flutter/material.dart';
import 'textrender.dart';

class Textcontrol extends StatelessWidget {
  final String jokeText;
  final VoidCallback changeText;

  Textcontrol(this.jokeText, this.changeText);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(14),
      child: Center(
        child: Column(
          children: [
            TextRender(jokeText),
            ElevatedButton(
              child: Text('Tell me a joke'),
              onPressed: changeText,
            )
          ],
        ),
      ),
    );
  }
}
