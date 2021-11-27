import 'package:flutter/material.dart';

Widget saveButton({
  Key? key,
  required VoidCallback? onPressed,
}) {
  return ElevatedButton.icon(
    key: key,
    onPressed: onPressed,
    icon: const Icon(Icons.save),
    label: const Text('Save'),
  );
}
