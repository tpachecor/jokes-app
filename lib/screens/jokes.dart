import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../utilities/textcontrol.dart';
import '../utilities/reset.dart';

class JokesScreen extends StatefulWidget {
  const JokesScreen({Key? key}) : super(key: key);

  @override
  _JokesScreenState createState() => _JokesScreenState();
}

class _JokesScreenState extends State<JokesScreen> {
  bool isConnected = true;
  String category = '';

  @override
  void initState() {
    super.initState();
    checkConnection();
  }

  Future<void> _changeText() async {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return Center(
          child: CircularProgressIndicator(),
        );
      },
    );

    final response =
        await http.get(Uri.parse('https://v2.jokeapi.dev/joke/Any'));

    Navigator.pop(context);

    if (response.statusCode == 200) {
      final jsonData = jsonDecode(response.body);
      setState(() {
        category = jsonData['category'] ?? '';
      });
    }
  }

  void _resetGame() {
    setState(() {
      category = '';
    });
  }

  @override
  void dispose() {
    super.dispose();
  }

  Future<void> checkConnection() async {
    bool connected = await checkInternetConnection();
    setState(() {
      isConnected = connected;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /*      body: Center(
        child: Text('JOKES'),
      ), */
      body: isConnected
          // ? category.isEmpty
          ? Textcontrol(category, _changeText)
          //: Reset(_resetGame)
          : const Center(
              child: Text(
                'Connection lost. Please check your network and try again.',
              ),
            ),
    );
  }
}

Future<bool> checkInternetConnection() async {
  await Future.delayed(const Duration(seconds: 2));
  return true;
}
