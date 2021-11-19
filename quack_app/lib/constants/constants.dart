import 'package:flutter/material.dart';

class Constants {
  // App Constants
  static const Color kPrimaryColor = Color.fromARGB(255, 255, 199, 4);
  static const Color kFavoritedColor = Colors.redAccent;
  static const Color kBackgroundGrey = Color.fromARGB(5, 10, 10, 10);
  static const IconData kFavorited = Icons.favorite;
  static const IconData kFavorite = Icons.favorite_border_outlined;
  // NavBar Constants
  static const double kNavBarFontSize = 36;
  static const int kNavBarDefaultIndex = 2;
  static const IconData kNavBarSettingsIcon = Icons.settings_outlined;
  static const IconData kNavBarSettingsActiveIcon = Icons.settings;
  static const IconData kNavBarNotificationsIcon = Icons.notifications_outlined;
  static const IconData kNavBarNotificationsActiveIcon = Icons.notifications;
  static const IconData kNavBarDineIcon = Icons.dining_outlined;
  static const IconData kNavBarDineActiveIcon = Icons.dining;
  static const IconData kNavBarFavoritesIcon = Icons.favorite_outline;
  static const IconData kNavBarFavoritesActiveIcon = Icons.favorite;
  static const IconData kNavBarProfileIcon = Icons.person_outline;
  static const IconData kNavBarProfileActiveIcon = Icons.person;

  static const Color kSeatingSectionOne = Color(0xffff0505);
  static const Color kSeatingSectionTwo = Color(0xffff8305);
  static const Color kSeatingSectionThree = Color(0xfff4ff05);
  static const Color kSeatingSectionFour = Color(0xff0eff05);
  static const Color kSeatingSectionFive = Color(0xff058bff);
  static const Color kSeatingSectionSix = Color(0xff05fff8);
  static const Color kSeatingSectionSeven = Color(0xff8d05ff);
  static const Color kSeatingSectionEight = Color(0xff2d05ff);
  static const Color kSeatingSectionNine = Color(0xffff05de);
  static const List<Color> kSeatingSections = [
    kSeatingSectionOne,
    kSeatingSectionTwo,
    kSeatingSectionThree,
    kSeatingSectionFour,
    kSeatingSectionFive,
    kSeatingSectionSix,
    kSeatingSectionSeven,
    kSeatingSectionEight,
    kSeatingSectionNine
  ];
}
