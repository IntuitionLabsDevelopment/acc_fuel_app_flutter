import 'package:flutter/material.dart';

Widget fieldsSection(String title, List<Widget> children) {
  return Column(
    children: [
      const Padding(padding: EdgeInsets.only(top: 8)),
      Text(title),
      const Padding(padding: EdgeInsets.only(bottom: 8)),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: children,
      ),
    ],
  );
}
