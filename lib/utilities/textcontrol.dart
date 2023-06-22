import 'package:flutter/material.dart';
import 'textrender.dart';
import '../models/joke.dart';
import 'dart:math';

class Textcontrol extends StatefulWidget {
  final Joke? joke;
  final Function() changeText;

  Textcontrol(this.joke, this.changeText);

  @override
  _TextcontrolState createState() => _TextcontrolState();
}

class _TextcontrolState extends State<Textcontrol> {
  bool showDelivery = false;

  @override
  Widget build(BuildContext context) {
    final setup = widget.joke?.setup ?? '';
    final delivery = widget.joke?.delivery ?? '';
    final type = widget.joke?.type;
    final jokesingle = widget.joke?.jokesingle ?? '';
    String textChange = '';

    List<String> jokeDeliveryOptions = [
      'Show Delivery',
      'Did You Guess?',
      'Reveal Punchline',
      'Here it is!',
      'Get ready...',
      'And the answer is...',
      'Unveiling the joke!',
      'Time for the punchline!',
      'Ready or not, here it comes!',
      'Discover the punchline!',
      'Want to know the answer?',
      'Curious about the joke?',
      'Prepare for the laughter!',
      'The moment of truth!',
      'Get your funny bone ready!',
      'Are you ready to laugh?',
      'Get set, go for the punchline!',
      'Unlock the joke!',
      'The big reveal!',
      'Laugh out loud!'
    ];

    int randomIndex = Random().nextInt(jokeDeliveryOptions.length);
    String buttonText = jokeDeliveryOptions[randomIndex];

    return Padding(
      padding: const EdgeInsets.all(14),
      child: Center(
        child: Column(
          children: [
            if (type == 'twopart')
              Column(
                children: [
                  if (setup.isNotEmpty) TextRender(setup),
                  if (showDelivery && delivery.isNotEmpty) TextRender(delivery),
                  if (!showDelivery) // Only show the "Show delivery" button if showDelivery is false
                    ElevatedButton(
                      child: Text('Show delivery'),
                      onPressed: () {
                        setState(() {
                          showDelivery = true;
                        });
                      },
                    ),
                ],
              ),
            if (type == 'single')
              if (jokesingle.isNotEmpty) TextRender(jokesingle),
            if (showDelivery || type == 'single')
              ElevatedButton(
                child: Text('Tell me another joke'),
                onPressed: () {
                  setState(() {
                    showDelivery = false; // Reset showDelivery to false
                  });
                  widget.changeText(); // Call the changeText function
                },
              ),
            if (!(type?.isEmpty ?? false) &&
                showDelivery == false &&
                type != 'single')
              ElevatedButton(
                child: Text((type == 'twopart' && !showDelivery)
                    ? 'Change joke'
                    : 'Tell me a joke'),
                onPressed: () {
                  setState(() {
                    showDelivery = false; // Reset showDelivery to false
                  });
                  widget.changeText(); // Call the changeText function
                },
              ),
          ],
        ),
      ),
    );
  }
}
