import 'package:flutter/material.dart';

class TextRender extends StatelessWidget {
  final String textShow;

  TextRender(this.textShow);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          textShow,
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
