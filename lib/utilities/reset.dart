import 'package:flutter/material.dart';

class Reset extends StatelessWidget {
  final VoidCallback resetHandler;

  Reset(this.resetHandler);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          ElevatedButton(
              onPressed: resetHandler, child: Text('Restart Changing Text'))
        ],
      ),
    );
  }
}
