import 'package:flutter/material.dart';

Widget selectionsButton({
  Key? key,
  required VoidCallback? onPressed,
}) {
  return ElevatedButton.icon(
    key: key,
    onPressed: onPressed,
    label: const Text('Selections'),
    icon: const Icon(Icons.settings),
  );
}
