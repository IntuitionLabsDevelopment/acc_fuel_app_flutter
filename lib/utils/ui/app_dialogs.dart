import 'package:acc_fuel_app_flutter/utils/helpers/car_helper.dart';
import 'package:acc_fuel_app_flutter/utils/helpers/conditions_helper.dart';
import 'package:acc_fuel_app_flutter/utils/helpers/track_helper.dart';
import 'package:acc_fuel_app_flutter/widgets/buttons/dropdown_button.dart';
import 'package:acc_fuel_app_flutter/widgets/buttons/full_width_elevated_button.dart';
import 'package:acc_fuel_app_flutter/widgets/buttons/github_button.dart';
import 'package:acc_fuel_app_flutter/widgets/buttons/leave_review_button.dart';
import 'package:acc_fuel_app_flutter/widgets/buttons/purchase_pro_version.dart';
import 'package:acc_fuel_app_flutter/widgets/selections_section.dart';
import 'package:flutter/material.dart';
import 'package:acc_fuel_app_flutter/constants/app_constants.dart' as constants;
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

void migrationDialog(BuildContext context) async {
  showDialog(
    context: context,
    builder: (context) => AlertDialog(
      title: const Text('A Thank You Message!'),
      content: const SizedBox(
          height: 200,
          child: Scrollbar(
            thumbVisibility: true,
            radius: Radius.circular(5),
            child: SingleChildScrollView(
                child: Text(constants.thankYouForInstalling)),
          )),
      actions: [
        leaveReviewButton(context, fullWidth: true),
        githubButton(context, fullWidth: true),
        purchaseProButton(context, fullWidth: true)
      ],
    ),
  );
}

void calculatorOptionsDialog(BuildContext context) async {
  showDialog(
    context: context,
    builder: (context) => AlertDialog(
      title: Text(AppLocalizations.of(context)!.selectCombo),
      content: Scrollbar(
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ValueListenableBuilder(
                  valueListenable: conditionsNotifier,
                  builder:
                      (BuildContext context, String conditions, Widget? child) {
                    return dropdownButton(
                        value: conditions,
                        title: AppLocalizations.of(context)!.conditions,
                        options: constants.trackConditions.keys.toList(),
                        optionMapper: (dynamic conditionsId) {
                          return Text(
                              getConditionsNameFromId(context, conditionsId));
                        },
                        onChanged: (dynamic value) {
                          updateConditions(value);
                        });
                  }),
              ValueListenableBuilder(
                  valueListenable: tracksNotifier,
                  builder: (BuildContext context, String track, Widget? child) {
                    return dropdownButton(
                        value: track,
                        title: AppLocalizations.of(context)!.track,
                        options: getAlphabeticalTrackIds(),
                        optionMapper: (dynamic trackId) {
                          return Text(getTrackNameFromId(trackId));
                        },
                        onChanged: (dynamic value) {
                          updateTracks(value);
                        });
                  }),
              ValueListenableBuilder(
                  valueListenable: classNotifier,
                  builder:
                      (BuildContext context, String carClass, Widget? child) {
                    return dropdownButton(
                        value: carClass,
                        title: AppLocalizations.of(context)!.carClass,
                        options: constants.classes.keys.toList(),
                        onChanged: (dynamic value) {
                          updateClass(value);
                        });
                  }),
              ValueListenableBuilder(
                  valueListenable: carOptionsNotifier,
                  builder: (BuildContext context, List<String> options,
                      Widget? child) {
                    return ValueListenableBuilder(
                        valueListenable: carNotifier,
                        builder:
                            (BuildContext context, String car, Widget? child) {
                          return dropdownButton(
                              value: car,
                              title: AppLocalizations.of(context)!.car,
                              options: options,
                              optionMapper: (dynamic carId) {
                                return Text(getCarNameFromId(carId));
                              },
                              onChanged: (dynamic value) {
                                updateCar(value);
                              });
                        });
                  }),
            ],
          ),
        ),
      ),
      actions: [
        fullWidthElevatedButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: Text(AppLocalizations.of(context)!.selectCombo))
      ],
    ),
  );
}
