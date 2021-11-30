import 'package:acc_fuel_app_flutter/constants/app_constants.dart' as constants;

String getTrackIdFromName(String name) {
  if (constants.tracks.containsValue(name)) {
    String id = constants.tracks.keys
        .firstWhere((element) => constants.tracks[element] == name);
    return id;
  }
  throw Error();
}

String getTrackNameFromId(String id) {
  String? name = constants.tracks[id];
  if (name == null) {
    throw Error();
  }
  return name;
}
