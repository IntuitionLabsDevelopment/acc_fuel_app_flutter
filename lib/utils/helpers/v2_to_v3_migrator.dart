/* MIGRATE USERS SAVED DATA FROM V2 TO V3 FORMAT */

import 'package:acc_fuel_app_flutter/utils/helpers/car_info_helper.dart';
import 'package:acc_fuel_app_flutter/utils/services/local_storage_service.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:acc_fuel_app_flutter/constants/app_constants.dart' as constants;

Future<bool> checkForMigration() async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();

  String? previousSavedVersion = prefs.getString('previousSavedVersion');
  if (previousSavedVersion == null) {
    /* RUN MIGRATION IF NO LAST VERSION FOUND */
    await migrateUserDataToV3();
    prefs.setString('previousSavedVersion', '3.0.0');
    return true;
  }

  return false;
}

Future<void> migrateUserDataToV3() async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();

  List<String> trackValues = constants.tracks;
  Iterable<String> carValues = constants.legacyCars.values;

  for (var i = 0; i < trackValues.length; i++) {
    String activeTrack = trackValues[i];
    String trimmedTrack = activeTrack.replaceAll(' ', '');

    for (final activeCar in carValues) {
      String trimmedCar = activeCar.replaceAll(' ', '');
      String carId = getCarIdFromLegacyName(activeCar);
      String legacyKey = trimmedTrack + trimmedCar;

      List<String>? dryData = prefs.getStringList(legacyKey);
      if (dryData != null) {
        try {
          saveCalcInputs(activeTrack, carId, 'dry', int.parse(dryData[0]),
              int.parse(dryData[1]), 0, double.parse(dryData[2]));

          /* prefs.remove(legacyKey); */
        } catch (e) {
          print(e.toString());
        }
      }

      List<String>? wetData = prefs.getStringList(legacyKey + 'Wet');
      if (wetData != null) {
        try {
          saveCalcInputs(activeTrack, carId, 'wet', int.parse(wetData[0]),
              int.parse(wetData[1]), 0, double.parse(wetData[2]));

          /* prefs.remove(legacyKey + 'Wet'); */
        } catch (e) {
          print(e.toString());
        }
      }
    }
  }
}
