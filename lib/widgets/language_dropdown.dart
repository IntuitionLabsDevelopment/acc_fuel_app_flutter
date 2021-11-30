import 'package:acc_fuel_app_flutter/widgets/buttons/dropdown_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:acc_fuel_app_flutter/constants/app_constants.dart' as constants;
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

ValueNotifier<String> localeNotifier = ValueNotifier('en');

void updateLocale(BuildContext context, String value) async {
  localeNotifier.value = value;
  SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.setString('setLocale', value);
  Get.updateLocale(Locale(value));
}

Widget languageDropdown() {
  return ValueListenableBuilder(
      valueListenable: localeNotifier,
      builder: (BuildContext context, String locale, Widget? child) {
        return dropdownButton(
            value: locale,
            title: AppLocalizations.of(context)!.language,
            options: constants.supportedLocales.keys.toList(),
            optionMapper: (dynamic languageCode) {
              return Text(constants.supportedLocales[languageCode]!);
            },
            onChanged: (dynamic value) {
              updateLocale(context, value);
            });
      });
}
