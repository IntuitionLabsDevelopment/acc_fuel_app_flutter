import 'package:flutter/material.dart';

Widget calculatorOutputSection({required String title, required String value}) {
  return Column(
    mainAxisSize: MainAxisSize.min,
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Text(
        title,
        textAlign: TextAlign.center,
      ),
      Text(
        value,
        textAlign: TextAlign.center,
        style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
      )
    ],
  );
}
