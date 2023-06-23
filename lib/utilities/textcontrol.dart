import 'package:flutter/material.dart';
import 'textrender.dart';
import 'deliveryrender.dart';
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
    final flags = widget.joke?.flags ??
        Flags(
          nsfw: false,
          religious: false,
          political: false,
          racist: false,
          sexist: false,
          explicit: false,
        );
    final delivery = widget.joke?.delivery ?? '';
    final type = widget.joke?.type;
    final jokesingle = widget.joke?.jokesingle ?? '';
    String textChange = '';
    double width = MediaQuery.of(context).size.width;

    List<String> jokeDeliveryOptions = [
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
      child: Column(
        children: [
          Expanded(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  if (type == 'twopart')
                    Column(
                      children: [
                        if (setup.isNotEmpty) TextRender(setup, flags),
                        if (showDelivery && delivery.isNotEmpty)
                          DeliveryRender(delivery),
                        SizedBox(height: 30),
                        if (!showDelivery) // Only show the "Show delivery" button if showDelivery is false
                          Container(
                            alignment: Alignment.bottomCenter,
                            child: ElevatedButton(
                              onPressed: () {
                                setState(() {
                                  showDelivery =
                                      true; // Reset showDelivery to false
                                });
                              },
                              style: ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                  borderRadius:
                                      BorderRadius.circular(width * 0.1),
                                ),
                                primary: Colors.white,
                                textStyle: TextStyle(
                                  color: Color.fromARGB(255, 242, 72, 234),
                                  fontSize: width * 0.04,
                                  fontFamily: 'ProductSans',
                                ),
                              ),
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius:
                                      BorderRadius.circular(width * 0.1),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(16.0),
                                  child: Text(
                                    buttonText,
                                    style: TextStyle(
                                      color: Color.fromARGB(255, 242, 72, 234),
                                      fontSize: width * 0.04,
                                      fontFamily: 'ProductSans',
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          )
                      ],
                    ),
                  if (type == 'single')
                    if (jokesingle.isNotEmpty) TextRender(jokesingle, flags),
                ],
              ),
            ),
          ),
          Container(
            alignment: Alignment.bottomCenter,
            child: ElevatedButton(
              onPressed: () {
                setState(() {
                  showDelivery = false; // Reset showDelivery to false
                });
                widget.changeText(); // Call the changeText function
              },
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(width * 0.1),
                ),
                primary: Colors.white,
              ),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(width * 0.1),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text(
                    'Tell me another joke',
                    style: TextStyle(
                      color: Color.fromARGB(255, 242, 72, 234),
                      fontSize: width * 0.04,
                      fontFamily: 'ProductSans',
                    ),
                  ),
                ),
              ),
            ),
          ),
          SizedBox(height: 20), // Adjust the spacing as needed
        ],
      ),
    );
  }
}
