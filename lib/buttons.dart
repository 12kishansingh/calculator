import 'dart:ui';

import 'package:flutter/material.dart';

class Mybutton extends StatelessWidget {
  const Mybutton(
      {super.key, this.color, this.textColor, required this.buttonText});
  final color;
  final textColor;
  final String buttonText; // 0 to 9 operationr

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: Container(
          color: color,
          child: Center(
            child: Text(
              buttonText,
              
              style: TextStyle(
                color: textColor,
                fontFamily: buttonText,
                fontSize: 22,
                fontWeight: FontWeight.bold,

              ),
            ),
          ),
        ),
      ),
    );
  }
 
}
