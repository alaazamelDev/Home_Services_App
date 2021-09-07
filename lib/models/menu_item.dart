import 'package:flutter/cupertino.dart';
import 'package:store_app/models/screens_enum.dart';

class MenuItem {
  late String title;
  late IconData icon;
  late bool isSelected = false;
  late ScreenType type;

  MenuItem({required this.icon, required this.title, required this.isSelected, required this.type});
}
