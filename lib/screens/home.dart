import 'dart:convert';
import 'package:flutter/material.dart';
import '../widgets/nav/bottom_navigation_bar.dart';
import 'about.dart';
import 'jokes.dart';

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool isConnected = false;
  String category = '';
  int _currentIndex = 0;
  late PageController _pageController = PageController(initialPage: 0);

  void _onTap(int index) {
    setState(() {
      _currentIndex = index;
    });
    _pageController.animateToPage(
      index,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    checkConnection();
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
      appBar: AppBar(
        title: Text('Jokes'),
      ),
      body: PageView(
        controller: _pageController,
        onPageChanged: _onTap,
        children: [Center(child: JokesScreen()), Center(child: AboutScreen())],
      ),
      bottomNavigationBar: CustomBottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: _onTap,
      ),
    );
  }
}

Future<bool> checkInternetConnection() async {
  await Future.delayed(const Duration(seconds: 2));
  return true;
}
