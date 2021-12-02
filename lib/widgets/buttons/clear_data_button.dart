import 'package:acc_fuel_app_flutter/utils/ui/app_toasts.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

Widget clearDataButton(BuildContext context) {
  return ElevatedButton.icon(
    onPressed: () async {
      try {
        SharedPreferences prefs = await SharedPreferences.getInstance();
        await prefs.clear();
        successToast(context);
      } catch (e) {
        errorToast(context);
      }
    },
    label: Text(AppLocalizations.of(context)!.clearData),
    icon: const Icon(Icons.delete),
  );
}
