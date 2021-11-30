import 'package:acc_fuel_app_flutter/widgets/form/fields_section.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

ValueNotifier<bool> usingLitresNotifier = ValueNotifier(true);
ValueNotifier<Map<String, String>> unitNotifier =
    ValueNotifier({'short': 'L', 'long': 'Litres'});

void updateUsingLitres(bool newValue) async {
  usingLitresNotifier.value = newValue;
  SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.setBool('setUsingLitres', newValue);

  if (newValue) {
    unitNotifier.value = {'short': 'L', 'long': 'Litres'};
  } else {
    unitNotifier.value = {'short': 'G', 'long': 'Gallons'};
  }
}

Widget unitSwitch() {
  return fieldsSection(
    'Units',
    [
      Expanded(
          child: ValueListenableBuilder(
              valueListenable: usingLitresNotifier,
              builder:
                  (BuildContext context, bool isUsingLitres, Widget? child) {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text('Gallons'),
                    Switch(
                      value: isUsingLitres,
                      onChanged: (bool value) {
                        updateUsingLitres(value);
                      },
                    ),
                    const Text('Litres'),
                  ],
                );
              })),
    ],
  );
}
