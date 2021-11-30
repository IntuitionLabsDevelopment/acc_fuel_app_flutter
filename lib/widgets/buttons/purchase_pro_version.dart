import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:acc_fuel_app_flutter/constants/app_constants.dart' as constants;
import 'dart:io' show Platform;

Widget purchaseProButton(BuildContext context, {bool fullWidth = false}) {
  return ElevatedButton.icon(
      style: fullWidth
          ? ElevatedButton.styleFrom(
              minimumSize: const Size.fromHeight(40),
            )
          : null,
      icon: const Icon(Icons.shopping_cart),
      onPressed: () async {
        Navigator.of(context).pop();
        if (Platform.isAndroid) {
          await launch(constants.androidProVersion);
        } else if (Platform.isIOS) {
          await launch(constants.iosProVersion);
        }
      },
      label: const Text('Purchase Ad-Free Version'));
}
