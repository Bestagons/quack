enum SeatingLocation {
  none_,
  section_1,
  section_2,
  section_3,
  section_4,
  section_6,
  section_7,
  section_5,
  section_8,
  section_9
}

extension ParseToString on SeatingLocation {
  String toShortString() {
    return toString().split('.').last.split("_").join(" ");
  }
}
