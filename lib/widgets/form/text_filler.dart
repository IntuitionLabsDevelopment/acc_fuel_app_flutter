import 'package:flutter/material.dart';

Widget formTextFiller(
  String text,
) {
  return Padding(
    padding: const EdgeInsets.only(top: 15),
    child: Text(
      text,
      style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
    ),
  );
}
