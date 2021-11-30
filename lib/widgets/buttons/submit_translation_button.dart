import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:acc_fuel_app_flutter/constants/app_constants.dart' as constants;

Widget submitTranslationButton({bool fullWidth = false}) {
  return ElevatedButton.icon(
      style: fullWidth
          ? ElevatedButton.styleFrom(
              minimumSize: const Size.fromHeight(40),
            )
          : null,
      icon: const FaIcon(FontAwesomeIcons.language),
      onPressed: () async {
        await launch(constants.translationLink);
      },
      label: const Text('Submit Translations'));
}
