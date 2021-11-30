import 'package:acc_fuel_app_flutter/widgets/buttons/clear_data_button.dart';
import 'package:acc_fuel_app_flutter/widgets/buttons/looking_for_themes_button.dart';

import 'package:flutter/material.dart';

Widget settingsScreen(BuildContext context) {
  return Center(
    child: Padding(
      padding: const EdgeInsets.fromLTRB(15, 10, 15, 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [lookingForThemesButton(context), clearDataButton()],
      ),
    ),
  );
}
