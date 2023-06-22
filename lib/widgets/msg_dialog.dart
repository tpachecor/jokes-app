import 'package:flutter/material.dart';

class MsgDialog extends StatelessWidget {
  final String msg;

  MsgDialog(this.msg);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(
                  Icons.warning,
                  color: Colors.red,
                  size: 24,
                )
              ],
            )
          ],
        ),
      ),
      content: Text(msg),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: Text('OK'),
        ),
      ],
    );
  }
}
