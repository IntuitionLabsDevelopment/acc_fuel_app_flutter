import 'package:acc_fuel_app_flutter/constants/app_constants.dart' as constants;

int getCarIdFromLegacyName(String name) {
  if (constants.legacyCars.containsValue(name)) {
    int id = constants.legacyCars.keys
        .firstWhere((element) => constants.legacyCars[element] == name);
    return id;
  }
  throw Error();
}

int getCarIdFromName(String name) {
  if (constants.cars.containsValue(name)) {
    int id = constants.cars.keys
        .firstWhere((element) => constants.cars[element] == name);
    return id;
  }
  throw Error();
}

String getCarNameFromId(int id) {
  String? name = constants.cars[id];
  if (name == null) {
    throw Error();
  }
  return name;
}
