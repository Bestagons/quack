import 'package:flutter/material.dart';
import 'package:quack_app/constants/constants.dart';

// Reuseable Navbar
class NavBar extends StatefulWidget {
  const NavBar({Key? key}) : super(key: key);
  @override
  State<StatefulWidget> createState() => _NavBarState();
}

/// Implements the NavBar State
class _NavBarState extends State<NavBar> {
  // The current index of the highlighted icon
  int currentIndex = Constants.kNavBarDefaultIndex;

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
        currentIndex: currentIndex,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        onTap: (index) => {
              // Updates the highlighted icon in the navbar
              setState(() {
                currentIndex = index;
                // need to update the page here
              })
            },
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Constants.kNavBarSettingsIcon,
                  color: Colors.black, size: Constants.kNavBarFontSize),
              label: "Settings",
              activeIcon: Icon(Constants.kNavBarSettingsActiveIcon,
                  color: Colors.black, size: Constants.kNavBarFontSize)),
          BottomNavigationBarItem(
              icon: Icon(Constants.kNavBarNotificationsIcon,
                  color: Colors.black, size: Constants.kNavBarFontSize),
              label: 'Home',
              activeIcon: Icon(Constants.kNavBarNotificationsActiveIcon,
                  color: Colors.black, size: Constants.kNavBarFontSize)),
          BottomNavigationBarItem(
              icon: Icon(Constants.kNavBarDineIcon,
                  color: Colors.black, size: Constants.kNavBarFontSize),
              label: 'Dining',
              activeIcon: Icon(Constants.kNavBarDineActiveIcon,
                  color: Colors.black, size: Constants.kNavBarFontSize)),
          BottomNavigationBarItem(
              icon: Icon(Constants.kNavBarFavoritesIcon,
                  color: Colors.black, size: Constants.kNavBarFontSize),
              label: 'Favorites',
              activeIcon: Icon(Constants.kNavBarFavoritesActiveIcon,
                  color: Colors.black, size: Constants.kNavBarFontSize)),
          BottomNavigationBarItem(
              icon: Icon(Constants.kNavBarProfileIcon,
                  color: Colors.black, size: Constants.kNavBarFontSize),
              label: 'Profile',
              activeIcon: Icon(Constants.kNavBarProfileActiveIcon,
                  color: Colors.black, size: Constants.kNavBarFontSize)),
        ]);
  }
}
