import 'package:acc_fuel_app_flutter/widgets/form/input_options.dart';
import 'package:acc_fuel_app_flutter/widgets/form/lap_time_input.dart';
import 'package:acc_fuel_app_flutter/widgets/form/laps_input.dart';
import 'package:acc_fuel_app_flutter/widgets/form/litres_per_lap_input.dart';
import 'package:acc_fuel_app_flutter/widgets/form/stint_length_input.dart';
import 'package:flutter/material.dart';

ValueNotifier<int> riskyFuelNotifier = ValueNotifier(0);
ValueNotifier<int> safeFuelNotifier = ValueNotifier(0);
ValueNotifier<int> estimatedLapsNotifier = ValueNotifier(0);

void updateRiskyFuel(int newValue) {
  riskyFuelNotifier.value = newValue;
}

void updateSafeFuel(int newValue) {
  safeFuelNotifier.value = newValue;
}

void updateEstimatedLaps(int newValue) {
  estimatedLapsNotifier.value = newValue;
}

void calculateFuel() {
  bool formationLap = formationLapNotifier.value;
  bool usingStint = usingStintNotifier.value;
  double lpl = double.parse(litresInput.text);
  int laps = formationLap ? 1 : 0;

  if (usingStint) {
    int lapMins = int.parse(minInput.text);
    int lapSecs = int.parse(secInput.text);
    int totalMins = int.parse(stintMinInput.text);
    if (stintHourInput.text != '') {
      totalMins += int.parse(stintHourInput.text) * 60;
    }
    int totalSecs = totalMins * 60;
    double totalLapSecs = (lapMins * 60 + lapSecs).toDouble();
    if (msInput.text != '') {
      totalLapSecs += double.parse('0.' + msInput.text);
    }
    laps += (totalSecs ~/ totalLapSecs).ceil();
  } else {
    laps += int.parse(lapsInput.text);
  }

  updateEstimatedLaps(laps);

  double riskyFuel = lpl * laps;
  double safeFuel = riskyFuel + lpl;

  int roundedRiskyFuel = riskyFuel.round();
  int roundedSafeFuel = safeFuel.round();

  updateRiskyFuel(roundedRiskyFuel);
  updateSafeFuel(roundedSafeFuel);
}
