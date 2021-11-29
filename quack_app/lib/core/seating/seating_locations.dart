import 'dart:ui';

import 'package:quack_app/constants/constants.dart';

enum SeatingLocation {
  none_0,
  section_1,
  section_2,
  section_3,
  section_4,
  section_5,
  section_6,
  section_7,
  section_8,
  section_9
}

extension ParseToString on SeatingLocation {
  String toShortString() {
    return toString().split('.').last.split("_").join(" ");
  }
}

extension FromColor on SeatingLocation {
  SeatingLocation fromColor(Color c) {
    int index = Constants.kSeatingSections.indexOf(c);
    return SeatingLocation.values[index + 1];
  }
}

extension FromString on SeatingLocation {
  SeatingLocation fromInt(int s) {
    return SeatingLocation.values.firstWhere((element) =>
        int.parse(
            element.toString().substring(element.toString().length - 1)) ==
        s);
  }
}
