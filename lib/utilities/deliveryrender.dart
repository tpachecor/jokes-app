import 'package:flutter/material.dart';

class DeliveryRender extends StatelessWidget {
  final String textShow;

  DeliveryRender(this.textShow);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Text(
          textShow,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontFamily: 'ProductSans',
          ),
        ),
      ),
    );
  }
}
