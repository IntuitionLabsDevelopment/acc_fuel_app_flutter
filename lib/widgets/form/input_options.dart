import 'package:acc_fuel_app_flutter/widgets/form/fields_section.dart';
import 'package:flutter/material.dart';

ValueNotifier<bool> usingStintNotifier = ValueNotifier(true);
ValueNotifier<bool> formationLapNotifier = ValueNotifier(false);

void updateUsingStint(bool newValue) {
  usingStintNotifier.value = newValue;
}

void updateFormationLap(bool newValue) {
  formationLapNotifier.value = newValue;
}

Widget inputOptionsFields() {
  return fieldsSection(
    'Options',
    [
      Expanded(
          child: ValueListenableBuilder(
              valueListenable: formationLapNotifier,
              builder:
                  (BuildContext context, bool formationLap, Widget? child) {
                return CheckboxListTile(
                  title: const Text(
                    'Formation Lap',
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
                    const Text('By Laps'),
                    Switch(
                      value: isUsingStint,
                      onChanged: (bool value) {
                        updateUsingStint(value);
                      },
                    ),
                    const Text('By Stint'),
                  ],
                );
              })),
    ],
  );
}
