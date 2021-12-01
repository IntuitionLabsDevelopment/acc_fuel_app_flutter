import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

Widget saveButton(
  BuildContext context, {
  required VoidCallback? onPressed,
}) {
  return ElevatedButton.icon(
    onPressed: onPressed,
    icon: const Icon(Icons.save),
    label: Text(AppLocalizations.of(context)!.save),
  );
}
