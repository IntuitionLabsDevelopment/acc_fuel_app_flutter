import 'package:acc_fuel_app_flutter/widgets/form/fields_section.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

ValueNotifier<bool> usingLitresNotifier = ValueNotifier(true);
ValueNotifier<Map<String, String>> unitNotifier =
    ValueNotifier({'short': 'L', 'long': 'Litres'});

void updateUsingLitres(bool newValue) async {
  usingLitresNotifier.value = newValue;
  SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.setBool('setUsingLitres', newValue);

  if (newValue) {
    unitNotifier.value = {'short': 'L', 'long': 'litres'};
  } else {
    unitNotifier.value = {'short': 'G', 'long': 'gallons'};
  }
}

Widget unitSwitch(BuildContext context) {
  return fieldsSection(
    AppLocalizations.of(context)!.units,
    [
      Expanded(
          child: ValueListenableBuilder(
              valueListenable: usingLitresNotifier,
              builder:
                  (BuildContext context, bool isUsingLitres, Widget? child) {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(AppLocalizations.of(context)!.gallons),
                    Switch(
                      value: isUsingLitres,
                      onChanged: (bool value) {
                        updateUsingLitres(value);
                      },
                    ),
                    Text(AppLocalizations.of(context)!.litres),
                  ],
                );
              })),
    ],
  );
}
