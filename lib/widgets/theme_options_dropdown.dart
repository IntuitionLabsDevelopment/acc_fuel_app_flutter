import 'package:acc_fuel_app_flutter/widgets/buttons/dropdown_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:acc_fuel_app_flutter/constants/app_constants.dart' as constants;
import 'package:shared_preferences/shared_preferences.dart';

ValueNotifier<String> themeModeNotifier = ValueNotifier('system');

void updateTheme(String value) async {
  themeModeNotifier.value = value;
  SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.setString('setTheme', value.toString());
}

Widget themeOptions() {
  return ValueListenableBuilder(
      valueListenable: themeModeNotifier,
      builder: (BuildContext context, String selectedTheme, Widget? child) {
        return Container(
          constraints: const BoxConstraints(maxWidth: 200),
          child: dropdownButton(
              value: selectedTheme,
              title: AppLocalizations.of(context)!.themeOptions,
              options: constants.themes.keys.toList(),
              optionMapper: (dynamic theme) {
                switch (theme) {
                  case 'light':
                    return Text(AppLocalizations.of(context)!.light);
                  case 'dark':
                    return Text(AppLocalizations.of(context)!.dark);
                }
                return Text(AppLocalizations.of(context)!.system);
              },
              onChanged: (dynamic value) {
                updateTheme(value);
              }),
        );
      });
}
