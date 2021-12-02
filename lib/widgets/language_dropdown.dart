import 'package:acc_fuel_app_flutter/widgets/buttons/dropdown_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localized_locales/flutter_localized_locales.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

/* https://api.flutter.dev/flutter/flutter_localizations/GlobalMaterialLocalizations-class.html */

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
        return Container(
          constraints: const BoxConstraints(maxWidth: 200),
          child: dropdownButton(
              value: locale.languageCode,
              title: AppLocalizations.of(context)!.language,
              options: AppLocalizations.supportedLocales
                  .map((e) => e.toLanguageTag())
                  .toList(),
              optionMapper: (dynamic languageCode) {
                return Text(LocaleNamesLocalizationsDelegate
                    .nativeLocaleNames[languageCode]!);
              },
              onChanged: (dynamic value) {
                updateLocale(value);
              }),
        );
      });
}
