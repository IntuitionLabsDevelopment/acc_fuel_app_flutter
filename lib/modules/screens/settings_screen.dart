import 'package:acc_fuel_app_flutter/utils/ui/app_dialogs.dart';
import 'package:acc_fuel_app_flutter/widgets/buttons/clear_data_button.dart';
import 'package:acc_fuel_app_flutter/widgets/buttons/github_button.dart';
import 'package:acc_fuel_app_flutter/widgets/buttons/leave_review_button.dart';
import 'package:acc_fuel_app_flutter/widgets/buttons/looking_for_themes_button.dart';
import 'package:acc_fuel_app_flutter/widgets/buttons/purchase_pro_version.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

Widget spacer() {
  return const SizedBox(
    height: 20,
  );
}

Widget settingsScreen(BuildContext context) {
  return Center(
    child: Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          lookingForThemesButton(context),
          spacer(),
          leaveReviewButton(context),
          spacer(),
          githubButton(context),
          spacer(),
          purchaseProButton(context),
          spacer(),
          clearDataButton(),
          spacer(),
          ElevatedButton.icon(
              icon: const FaIcon(FontAwesomeIcons.heart),
              onPressed: () {
                migrationDialog(context);
              },
              label: const Text('Thank you'))
        ],
      ),
    ),
  );
}
