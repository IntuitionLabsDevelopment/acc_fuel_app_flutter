import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:acc_fuel_app_flutter/constants/app_constants.dart' as constants;

Widget githubButton(BuildContext context, {bool fullWidth = false}) {
  return ElevatedButton.icon(
      style: fullWidth
          ? ElevatedButton.styleFrom(
              minimumSize: const Size.fromHeight(40),
            )
          : null,
      icon: const FaIcon(FontAwesomeIcons.github),
      onPressed: () async {
        Navigator.of(context).pop();
        await launch(constants.githubRepo);
      },
      label: const Text('View Github Repo'));
}
