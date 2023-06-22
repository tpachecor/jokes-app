import 'package:flutter/material.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  final int currentIndex;
  final ValueChanged<int> onTap;

  const CustomBottomNavigationBar({
    required this.currentIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: currentIndex,
      onTap: onTap,
      items: [
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Jokes',
        ),
        BottomNavigationBarItem(
          icon: const Icon(
            Icons.favorite,
            color: Colors.red,
            size: 24,
          ),
          label: 'About',
        ),
      ],
    );
  }
}
