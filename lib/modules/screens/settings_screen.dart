import 'package:acc_fuel_app_flutter/utils/ui/app_dialogs.dart';
import 'package:acc_fuel_app_flutter/widgets/buttons/clear_data_button.dart';
import 'package:acc_fuel_app_flutter/widgets/buttons/github_button.dart';
import 'package:acc_fuel_app_flutter/widgets/buttons/leave_review_button.dart';
import 'package:acc_fuel_app_flutter/widgets/theme_options_dropdown.dart';
import 'package:acc_fuel_app_flutter/widgets/buttons/purchase_pro_version.dart';
import 'package:acc_fuel_app_flutter/widgets/language_dropdown.dart';
import 'package:acc_fuel_app_flutter/widgets/unit_switch.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

Widget spacer() {
  return const SizedBox(
    height: 15,
  );
}

Widget settingsScreen(BuildContext context) {
  return Center(
    child: Padding(
      padding: const EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          unitSwitch(context),
          spacer(),
          themeOptions(),
          spacer(),
          languageDropdown(),
          spacer(),
          githubButton(context),
          spacer(),
          purchaseProButton(context),
          spacer(),
          leaveReviewButton(context),
          spacer(),
          clearDataButton(context),
          spacer(),
          ElevatedButton.icon(
              icon: const FaIcon(FontAwesomeIcons.heart),
              onPressed: () {
                migrationDialog(context);
              },
              label: Text(AppLocalizations.of(context)!.thankYou))
        ],
      ),
    ),
  );
}
