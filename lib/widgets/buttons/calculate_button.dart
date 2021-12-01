import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

Widget calculateButton(
  BuildContext context, {
  required VoidCallback? onPressed,
}) {
  return ElevatedButton.icon(
    onPressed: onPressed,
    icon: const Icon(Icons.calculate),
    label: Text(AppLocalizations.of(context)!.calculate),
  );
}
