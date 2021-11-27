import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

Future<void> saveCalcInputs(String track, String carId, String conditions,
    int m, int s, int ms, double litres) async {
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

  List<dynamic> dataForConditions = [m, s, ms, litres];
  toSaveData[carId]![conditions] = dataForConditions;

  prefs.setString(track, jsonEncode(toSaveData));
}

Future<List<dynamic>> getSavedUserData(
    String track, String carId, String conditions) async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();

  /* GET EXISTING DATA */
  String? trackData = prefs.getString(track);

  if (trackData != null) {
    dynamic savedData = jsonDecode(trackData);
    if (savedData[carId]?[conditions] != null) {
      return savedData[carId]![conditions]!;
    }
  }

  return [0, 0, 0, 0];
}
