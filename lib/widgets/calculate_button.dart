import 'package:flutter/material.dart';

Widget calculateButton({
  Key? key,
  required VoidCallback? onPressed,
}) {
  return ElevatedButton.icon(
    key: key,
    onPressed: onPressed,
    icon: const Icon(Icons.calculate),
    label: const Text('Calculate'),
  );
}
