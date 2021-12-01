import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

Widget selectionsButton(
  BuildContext context, {
  required VoidCallback? onPressed,
}) {
  return ElevatedButton.icon(
    onPressed: onPressed,
    label: Text(AppLocalizations.of(context)!.selections),
    icon: const Icon(Icons.settings),
  );
}
