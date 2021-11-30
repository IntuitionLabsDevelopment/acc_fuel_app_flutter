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
  Map<String, List<String>> classesMap = Map.of(constants.classes);
  List<String>? cars = classesMap[carClass];

  if (cars == null) {
    throw Error();
  }

  Map<String, String> carsMap = constants.cars;
  Map<String, String> filteredCars = Map.from(carsMap)
    ..removeWhere((key, value) => !cars.contains(key));
  /* SORT ALPHABETICALLY */
  List<String> filteredAndSortedCarIds = List.from(filteredCars.keys)
    ..sort((a, b) => getCarNameFromId(a).compareTo(getCarNameFromId(b)));
  return filteredAndSortedCarIds;
}
