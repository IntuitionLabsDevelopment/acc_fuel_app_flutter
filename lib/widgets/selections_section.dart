import 'package:acc_fuel_app_flutter/utils/helpers/car_helper.dart';
import 'package:acc_fuel_app_flutter/utils/helpers/conditions_helper.dart';
import 'package:acc_fuel_app_flutter/utils/helpers/track_helper.dart';
import 'package:acc_fuel_app_flutter/utils/ui/app_dialogs.dart';
import 'package:acc_fuel_app_flutter/widgets/buttons/selections_button.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

ValueNotifier<String> conditionsNotifier = ValueNotifier('0');
ValueNotifier<String> tracksNotifier = ValueNotifier('0');
ValueNotifier<String> classNotifier = ValueNotifier('GT3');
ValueNotifier<String> carNotifier = ValueNotifier('0');
ValueNotifier<List<String>> carOptionsNotifier =
    ValueNotifier(getCarsFromClass(classNotifier.value));

void updateConditions(String value) async {
  conditionsNotifier.value = value;
  SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.setString('setConditions', value);
}

void updateTracks(String value) async {
  tracksNotifier.value = value;
  SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.setString('setTrack', value);
}

void updateClass(String value) async {
  if (classNotifier.value != value) {
    List<String> carsForClass = getCarsFromClass(value);
    carOptionsNotifier.value = carsForClass;
    updateCar(carsForClass[0]);
  }
  classNotifier.value = value;

  SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.setString('setClass', value);
}

void updateCar(String value) async {
  carNotifier.value = value;
  SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.setString('setCar', value);
}

Widget calculatorSelectionsSection(BuildContext context) {
  return Padding(
    padding: const EdgeInsets.only(top: 10),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        selectionsButton(onPressed: () {
          calculatorOptionsDialog(context);
        }),
        ValueListenableBuilder(
            valueListenable: conditionsNotifier,
            builder: (BuildContext context, String conditions, Widget? child) {
              return Text('Conditions: ' + getConditionsNameFromId(conditions));
            }),
        ValueListenableBuilder(
            valueListenable: tracksNotifier,
            builder: (BuildContext context, String track, Widget? child) {
              return Text('Track: ' + getTrackNameFromId(track));
            }),
        ValueListenableBuilder(
            valueListenable: classNotifier,
            builder: (BuildContext context, String carClass, Widget? child) {
              return Text('Class: ' + carClass);
            }),
        ValueListenableBuilder(
            valueListenable: carNotifier,
            builder: (BuildContext context, String car, Widget? child) {
              return Text('Car: ' + getCarNameFromId(car));
            }),
      ],
    ),
  );
}
