import 'package:flutter/material.dart';
import '../models/joke.dart';

class TextRender extends StatelessWidget {
  final String textShow;
  final Flags flags;

  TextRender(this.textShow, this.flags);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              textShow,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontFamily: 'ProductSans',
              ),
            ),
            SizedBox(height: 10),
            Center(
              child: Wrap(
                spacing: 8,
                runSpacing: 4,
                children: [
                  if (flags.nsfw) TagText('NSFW'),
                  if (flags.religious) TagText('Religious'),
                  if (flags.political) TagText('Political'),
                  if (flags.racist) TagText('Racist'),
                  if (flags.sexist) TagText('Sexist'),
                  if (flags.explicit) TagText('Explicit'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class TagText extends StatelessWidget {
  final String text;

  TagText(this.text);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 6),
      decoration: BoxDecoration(
        color: Colors.grey[300],
        borderRadius: BorderRadius.circular(16),
      ),
      child: Text(
        text,
        style: TextStyle(
          fontSize: 12,
          fontFamily: 'ProductSans',
          color: Colors.black87,
        ),
      ),
    );
  }
}
