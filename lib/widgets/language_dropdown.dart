import 'package:acc_fuel_app_flutter/widgets/buttons/dropdown_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:acc_fuel_app_flutter/constants/app_constants.dart' as constants;
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

ValueNotifier<Locale> localeNotifier = ValueNotifier(const Locale('en'));

void updateLocale(String value) async {
  localeNotifier.value = Locale(value);
  SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.setString('setLocaleCode', value);
  Get.updateLocale(Locale(value));
}

Widget languageDropdown() {
  return ValueListenableBuilder(
      valueListenable: localeNotifier,
      builder: (BuildContext context, Locale locale, Widget? child) {
        return dropdownButton(
            value: locale.languageCode,
            title: AppLocalizations.of(context)!.language,
            options: constants.supportedLocales.keys.toList(),
            optionMapper: (dynamic languageCode) {
              return Text(constants.supportedLocales[languageCode]!);
            },
            onChanged: (dynamic value) {
              updateLocale(value);
            });
      });
}
