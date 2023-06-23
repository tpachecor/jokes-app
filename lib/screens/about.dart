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
            ClipRRect(
              borderRadius: BorderRadius.circular(50),
              child: Image.asset(
                'assets/images/profile_image.jpg',
                width: 100,
                height: 100,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 16),
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
