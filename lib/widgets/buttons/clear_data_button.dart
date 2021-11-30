import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

Widget clearDataButton() {
  return ElevatedButton.icon(
    onPressed: () async {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.clear();
    },
    label: const Text('Clear Data'),
    icon: const Icon(Icons.delete),
  );
}
