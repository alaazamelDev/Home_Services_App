import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:store_app/models/screens_enum.dart';
import 'package:store_app/responsive.dart';
import 'package:store_app/screens/categories/categories_screen.dart';
import 'package:store_app/screens/drawar/drawar_screen.dart';
import 'package:store_app/screens/messages/messages_screen.dart';
import 'package:store_app/screens/profile/profile_screen.dart';
import 'package:store_app/screens/settings/settings_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final ZoomDrawerController _drawerController = ZoomDrawerController();
  ScreenType currentScreen = ScreenType.home;
  bool isDrawerOpened = false;

  //shared preferences to save whether the app if launched for the first time
  //or not

  @override
  void initState() {
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return ZoomDrawer(
      menuScreen: DrawarScreen(
        onDrawarItemSelected: (item) {
          setState(() {
            currentScreen = item.type;
            inverseDrawerState();
          });
        },
      ),
      mainScreen:
          getDrawarPage(currentScreen),
      slideWidth: Responsive.getScreenWidth(context: context) * 0.5,
      closeCurve: Curves.ease,
      controller: _drawerController,
      backgroundColor: Colors.grey.shade300,
      angle: 0.0,
    );
  }

  Widget getDrawarPage(ScreenType type) {
    switch (type) {
      case ScreenType.home:
        return CategoriesScreen(
          onBackPressed: inverseDrawerState,
        );
      case ScreenType.profile:
        return ProfileScreen(
          onBackPressed: inverseDrawerState,
        );
      case ScreenType.messages:
        return MessagesScreen(
          onBackPressed: inverseDrawerState,
        );
      case ScreenType.settings:
        return SettingsScreen(
          onBackPressed: inverseDrawerState,
        );
    }
  }

  inverseDrawerState() {
    if (!_drawerController.isOpen!()) {
      _drawerController.open!();
    } else {
      _drawerController.close!();
    }
    _drawerController.toggle!();
  }
}
