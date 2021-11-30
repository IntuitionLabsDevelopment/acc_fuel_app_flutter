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

void migrationDialog(BuildContext context) async {
  showDialog(
    context: context,
    builder: (context) => AlertDialog(
      title: const Text('A Thank You Message!'),
      content: const SizedBox(
          height: 200,
          child: Scrollbar(
            isAlwaysShown: true,
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
      title: const Text('Select Save Combination'),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ValueListenableBuilder(
              valueListenable: conditionsNotifier,
              builder:
                  (BuildContext context, String conditions, Widget? child) {
                return dropdownButton(
                    value: conditions,
                    title: 'Conditions',
                    options: constants.trackConditions.keys.toList(),
                    optionMapper: (dynamic conditionsId) {
                      return Text(getConditionsNameFromId(conditionsId));
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
                    title: 'Track',
                    options: constants.tracks.keys.toList(),
                    optionMapper: (dynamic trackId) {
                      return Text(getTrackNameFromId(trackId));
                    },
                    onChanged: (dynamic value) {
                      updateTracks(value);
                    });
              }),
          ValueListenableBuilder(
              valueListenable: classNotifier,
              builder: (BuildContext context, String carClass, Widget? child) {
                return dropdownButton(
                    value: carClass,
                    title: 'Class',
                    options: constants.classes.keys.toList(),
                    onChanged: (dynamic value) {
                      updateClass(value);
                    });
              }),
          ValueListenableBuilder(
              valueListenable: carOptionsNotifier,
              builder:
                  (BuildContext context, List<String> options, Widget? child) {
                return ValueListenableBuilder(
                    valueListenable: carNotifier,
                    builder: (BuildContext context, String car, Widget? child) {
                      return dropdownButton(
                          value: car,
                          title: 'Car',
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
      actions: [
        fullWidthElevatedButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: const Text('Select Combination'))
      ],
    ),
  );
}

void whereThemeOptionsDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (context) => const AlertDialog(
      title: Text('Looking for Theme Options?'),
      content: Text(
          'Theme Options have been removed and the app now uses System Default Theme'),
    ),
  );
}
