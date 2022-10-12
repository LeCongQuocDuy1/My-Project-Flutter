import 'package:flutter/material.dart';

class TitleWidget extends StatelessWidget {
  String title;

  TitleWidget(this.title);

  @override
  Widget build(BuildContext context) {
    return Container(
      // alignment: Alignment.center,
      margin: EdgeInsets.symmetric(
        vertical: 20,
        horizontal: 10,
      ),
      child: Text(
        "$title",
        style: TextStyle(
          fontSize: 25,
          fontWeight: FontWeight.bold,
          color: Color.fromRGBO(24, 132, 111, 0.8),
        ),
      ),
    );
  }
}

