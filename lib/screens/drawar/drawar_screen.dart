import 'package:flutter/material.dart';
import 'package:store_app/constantas.dart';
import 'package:store_app/models/menu_item.dart';
import 'package:store_app/responsive.dart';
import 'package:store_app/screens/drawar/components/menu_option.dart';

class DrawarScreen extends StatefulWidget {
  const DrawarScreen({Key? key, required this.onDrawarItemSelected})
      : super(key: key);
  final Function(MenuItem) onDrawarItemSelected;

  @override
  State<DrawarScreen> createState() => _DrawarScreenState();
}

class _DrawarScreenState extends State<DrawarScreen> {
  List<bool> selectionState = [true, false, false, false];
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: kBodyGreyColor,
      child: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(
              left: Responsive.getScreenWidth(context: context) * 0.15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(
              menuItems.length,
              (index) {
                return MenuOption(
                  item: menuItems[index],
                  selectedItem: (item) {
                    setState(() {
                      for (int i = 0; i < menuItems.length; i++) {
                        if (item == menuItems[i]) {
                          menuItems[i].isSelected = true;
                        } else {
                          menuItems[i].isSelected = false;
                        }
                        widget.onDrawarItemSelected(item);
                      }
                    });
                  },
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
