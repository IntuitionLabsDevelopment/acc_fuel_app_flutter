import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

Future<void> saveCalcInputs(String track, int carId, String conditions, int m,
    int s, int ms, double litres) async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();

  /* GET EXISTING DATA */
  String? trackData = prefs.getString(track);

  Map<int, Map<String, List<double>>> toSaveData = {};
  if (trackData != null) {
    /* MAP trackData TO toSaveData */
    toSaveData = json.decode(trackData);
  }
  if (toSaveData[carId] == null) {
    toSaveData[carId] = {};
  }

  List<double> dataForConditions = [
    m.toDouble(),
    s.toDouble(),
    ms.toDouble(),
    litres
  ];

  toSaveData[carId]![conditions] = dataForConditions;

  prefs.setString(track, json.encode(toSaveData));
  print('SAVED ${track}: ${json.encode(toSaveData)}');
}

Future<List<double>> getSavedUserData(
    String track, int carId, String conditions) async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();

  /* GET EXISTING DATA */
  String? trackData = prefs.getString(track);

  if (trackData != null) {
    Map<int, Map<String, List<double>>> savedData = json.decode(trackData);
    if (savedData[carId]?[conditions] != null) {
      return savedData[carId]![conditions]!;
    }
  }

  return [0, 0, 0, 0];
}
