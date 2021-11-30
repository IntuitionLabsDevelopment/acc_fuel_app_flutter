import 'package:acc_fuel_app_flutter/constants/app_constants.dart' as constants;

String getConditionsIdFromName(String name) {
  if (constants.trackConditions.containsValue(name)) {
    String id = constants.trackConditions.keys
        .firstWhere((element) => constants.trackConditions[element] == name);
    return id;
  }
  throw Error();
}

String getConditionsNameFromId(String id) {
  String? name = constants.trackConditions[id];
  if (name == null) {
    throw Error();
  }
  return name;
}
