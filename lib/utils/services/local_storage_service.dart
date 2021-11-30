import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

Future<void> saveCalcInputs(String track, String carId, String conditions,
    double litres, int? m, int? s, int? ms) async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();

  /* GET EXISTING DATA */
  String? trackData = prefs.getString(track);

  dynamic toSaveData = {};
  if (trackData != null) {
    /* MAP trackData TO toSaveData */
    toSaveData = jsonDecode(trackData);
  }
  if (toSaveData[carId] == null) {
    toSaveData[carId] = {};
  }

  if (toSaveData[carId]![conditions] == null) {
    toSaveData[carId]![conditions] = {};
  }

  toSaveData[carId]![conditions]['lpl'] = [litres];
  if (m != null || s != null || ms != null) {
    toSaveData[carId]![conditions]['lapTime'] = [m ?? 0, s ?? 0, ms ?? 0];
  }

  prefs.setString(track, jsonEncode(toSaveData));
}

Future<Map<String, List<dynamic>>> getSavedUserData(
    String track, String carId, String conditions) async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();

  /* GET EXISTING DATA */
  String? trackData = prefs.getString(track);

  if (trackData != null) {
    dynamic savedData = jsonDecode(trackData);
    if (savedData[carId]?[conditions] != null) {
      return Map.from(savedData[carId]![conditions]!);
    }
  }

  return {
    'lapTime': [null, null, null],
    'lpl': [null]
  };
}
