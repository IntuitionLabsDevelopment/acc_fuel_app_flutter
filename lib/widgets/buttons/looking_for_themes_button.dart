import 'package:acc_fuel_app_flutter/utils/ui/app_dialogs.dart';
import 'package:flutter/material.dart';

Widget lookingForThemesButton(BuildContext context) {
  return ElevatedButton.icon(
    onPressed: () {
      whereThemeOptionsDialog(context);
    },
    label: const Text('Looking for Theme Options?'),
    icon: const Icon(Icons.help_outline_outlined),
  );
}
