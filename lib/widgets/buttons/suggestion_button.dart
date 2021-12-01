import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:acc_fuel_app_flutter/constants/app_constants.dart' as constants;
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

Widget suggestionButton(BuildContext context, {bool fullWidth = false}) {
  return ElevatedButton.icon(
      style: fullWidth
          ? ElevatedButton.styleFrom(
              minimumSize: const Size.fromHeight(40),
            )
          : null,
      icon: const FaIcon(FontAwesomeIcons.paperPlane),
      onPressed: () async {
        Navigator.of(context).pop();
        await launch(constants.suggestionLink);
      },
      label: Text(AppLocalizations.of(context)!.sendSuggestion));
}
