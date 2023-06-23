import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:connectivity/connectivity.dart';
import '../utilities/textcontrol.dart';
import '../widgets/msg_dialog.dart';
import '../models/joke.dart';

class JokesScreen extends StatefulWidget {
  const JokesScreen({Key? key}) : super(key: key);

  @override
  _JokesScreenState createState() => _JokesScreenState();
}

class _JokesScreenState extends State<JokesScreen> {
  bool isConnected = false;
  Joke? joke;
  String category = '';
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    checkConnection();
  }

  Future<void> _changeText() async {
    void _showErrorDialog(String errorMessage) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return MsgDialog(errorMessage);
        },
      );
    }

    if (!isConnected) {
      _showErrorDialog(
          "No internet connection. Please check your connection and try again.");
      return;
    }

    setState(() {
      isLoading = true;
    });

    try {
      final dio = Dio();
      dio.options.connectTimeout = 10000; // 10 seconds
      dio.options.receiveTimeout = 10000; // 10 seconds

      final response = await dio.get('https://v2.jokeapi.dev/joke/Any');

      setState(() {
        isLoading = false;
      });

      if (response.statusCode == 200) {
        final jsonData = response.data;
        if (!jsonData['error']) {
          setState(() {
            joke = Joke.fromJson(jsonData);
          });
        } else {
          _showErrorDialog("Oops! Something went wrong. Please try again.");
        }
      } else {
        _showErrorDialog("Oops! Something went wrong. Please try later.");
      }
    } catch (e) {
      setState(() {
        isLoading = false;
      });

      if (e is DioError && e.type == DioErrorType.connectTimeout) {
        _showErrorDialog("Request timed out. Please try again later.");
      } else {
        _showErrorDialog("Check your internet connection.");
      }
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
    var connectivityResult = await Connectivity().checkConnectivity();
    setState(() {
      isConnected = connectivityResult != ConnectivityResult.none;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/background.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: isConnected
            ? Stack(
                children: [
                  Textcontrol(joke, _changeText),
                  if (isLoading)
                    Container(
                      color: Colors.black54,
                      child: Center(
                        child: CircularProgressIndicator(),
                      ),
                    ),
                ],
              )
            : Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Connection lost. Please check your network and try again.',
                    ),
                    ElevatedButton(
                      onPressed: checkConnection,
                      child: Text('Retry'),
                    ),
                  ],
                ),
              ),
      ),
    );
  }
}
