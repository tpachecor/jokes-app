import 'package:flutter/material.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Made with ',
                  style: TextStyle(fontSize: 24),
                ),
                const Icon(
                  Icons.favorite,
                  color: Colors.red,
                  size: 24,
                ),
                const Text(
                  ' in Chile ',
                  style: TextStyle(fontSize: 24),
                ),
              ],
            ),
            const SizedBox(height: 16),
            const Text(
              '@tpachecor',
              style: TextStyle(fontSize: 24),
            ),
          ],
        ),
      ),
    );
  }
}
