import 'package:acc_fuel_app_flutter/constants/app_constants.dart' as constants;

String getCarIdFromLegacyName(String name) {
  if (constants.legacyCars.containsValue(name)) {
    String id = constants.legacyCars.keys
        .firstWhere((element) => constants.legacyCars[element] == name);
    return id;
  }
  throw Error();
}

String getCarIdFromName(String name) {
  if (constants.cars.containsValue(name)) {
    String id = constants.cars.keys
        .firstWhere((element) => constants.cars[element] == name);
    return id;
  }
  throw Error();
}

String getCarNameFromId(String id) {
  String? name = constants.cars[id];
  if (name == null) {
    throw Error();
  }
  return name;
}

List<String> getCarsFromClass(String carClass) {
  List<String>? cars = constants.classes[carClass];
  if (cars == null) {
    throw Error();
  }
  return cars;
}
