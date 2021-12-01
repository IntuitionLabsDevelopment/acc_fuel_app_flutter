import 'package:acc_fuel_app_flutter/widgets/form/fields_section.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

ValueNotifier<bool> usingStintNotifier = ValueNotifier(true);
ValueNotifier<bool> formationLapNotifier = ValueNotifier(false);

void updateUsingStint(bool newValue) async {
  usingStintNotifier.value = newValue;
  SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.setBool('setUsingStint', newValue);
}

void updateFormationLap(bool newValue) async {
  formationLapNotifier.value = newValue;
  SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.setBool('setFormationLap', newValue);
}

Widget inputOptionsFields(BuildContext context) {
  return fieldsSection(
    AppLocalizations.of(context)!.options,
    [
      Expanded(
          child: ValueListenableBuilder(
              valueListenable: formationLapNotifier,
              builder:
                  (BuildContext context, bool formationLap, Widget? child) {
                return CheckboxListTile(
                  title: Text(
                    AppLocalizations.of(context)!.formationLap,
                  ),
                  value: formationLap,
                  onChanged: (bool? value) {
                    updateFormationLap(value!);
                  },
                );
              })),
      Expanded(
          child: ValueListenableBuilder(
              valueListenable: usingStintNotifier,
              builder:
                  (BuildContext context, bool isUsingStint, Widget? child) {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(AppLocalizations.of(context)!.byLaps),
                    Switch(
                      value: isUsingStint,
                      onChanged: (bool value) {
                        updateUsingStint(value);
                      },
                    ),
                    Text(AppLocalizations.of(context)!.byStint),
                  ],
                );
              })),
    ],
  );
}
