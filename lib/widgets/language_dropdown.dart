import 'package:acc_fuel_app_flutter/widgets/buttons/dropdown_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localized_locales/flutter_localized_locales.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

/* https://api.flutter.dev/flutter/flutter_localizations/GlobalMaterialLocalizations-class.html */

ValueNotifier<Locale> localeNotifier = ValueNotifier(const Locale('en'));

void updateLocale(String value) async {
  List<String> splitValue = value.split('-');
  Locale toSave =
      Locale(splitValue[0], splitValue.length > 1 ? splitValue[1] : '');
  localeNotifier.value = toSave;
  SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.setString('setLocaleCode', value);
  Get.updateLocale(toSave);
}

List<String> getSortedLanguageOptions() {
  List<String> languages =
      AppLocalizations.supportedLocales.map((e) => e.toLanguageTag()).toList();
  languages.sort((a, b) => a.compareTo(b));
  return languages;
}

Widget languageDropdown() {
  return ValueListenableBuilder(
      valueListenable: localeNotifier,
      builder: (BuildContext context, Locale locale, Widget? child) {
        return Container(
          constraints: const BoxConstraints(maxWidth: 200),
          child: dropdownButton(
              value: locale.toLanguageTag(),
              title: AppLocalizations.of(context)!.language,
              options: getSortedLanguageOptions(),
              optionMapper: (dynamic languageCode) {
                String code = languageCode as String;
                return Text(LocaleNamesLocalizationsDelegate
                    .nativeLocaleNames[code.replaceAll('-', '_')]!);
              },
              onChanged: (dynamic value) {
                updateLocale(value);
              }),
        );
      });
}
