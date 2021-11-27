import 'package:flutter/material.dart';

Widget fieldsSection(String title, List<Widget> children) {
  return Column(
    children: [
      Text(title),
      const Padding(padding: EdgeInsets.only(bottom: 8)),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: children,
      ),
    ],
  );
}
