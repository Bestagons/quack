import 'package:flutter/material.dart';
import 'package:quack_app/constants/constants.dart';
import 'package:quack_app/screens/homepage/home_screen.dart';
import 'package:quack_app/screens/notification/notification_screen.dart';
import 'package:quack_app/screens/friends/friends_screen.dart';
import 'package:quack_app/screens/settings/settings_screen.dart';
import 'package:quack_app/screens/favorite/favorite_screen.dart';

// Reuseable Navbar
class NavBar extends StatefulWidget {
  const NavBar({Key? key}) : super(key: key);
  @override
  State<StatefulWidget> createState() => _NavBarState();
}

// Implements the NavBar State
class _NavBarState extends State<NavBar> {
  // The current index of the highlighted icon
  int currentIndex = Constants.kNavBarDefaultIndex;

  // To implement the new page,
  // change the Text() below to the page's class (i.e. HomeScreen())
  static const List<Widget> _widgetOptions = <Widget>[
    SettingsScreen(title: "Settings"),
    NotificationScreen(title: "Notifications"),
    HomeScreen(title: "Quack"),
    FavoriteScreen(title: "Favorite"),
    FriendsScreen(title: "Friends")
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            leading: IconButton(onPressed: () {}, icon: const Icon(Icons.menu)),
            title: const Text("Quack")),
        body: Center(
          child: _widgetOptions.elementAt(currentIndex),
        ),
        bottomNavigationBar: BottomNavigationBar(
            currentIndex: currentIndex,
            showSelectedLabels: false,
            showUnselectedLabels: false,
            onTap: (index) => {
                  // Updates the highlighted icon in the navbar
                  setState(() {
                    currentIndex = index;
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
                  label: 'Friends',
                  activeIcon: Icon(Constants.kNavBarProfileActiveIcon,
                      color: Colors.black, size: Constants.kNavBarFontSize)),
            ]));
  }
}
