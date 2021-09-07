import 'package:flutter/material.dart';
import 'package:store_app/constantas.dart';
import 'package:store_app/models/menu_item.dart';
import 'package:store_app/responsive.dart';


class MenuOption extends StatelessWidget {
  const MenuOption({
    Key? key,
    required this.item,
    required this.selectedItem,
  }) : super(key: key);
  final MenuItem item;
  final ValueChanged<MenuItem> selectedItem;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => selectedItem(item),
      child: Column(
        children: [
          Container(
            width: Responsive.getScreenWidth(context: context) * 0.2,
            height: Responsive.getScreenWidth(context: context) * 0.2,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50),
              color: item.isSelected ? kPrimaryColor : kMenuItemColor,
            ),
            child: Icon(
              item.icon,
              size: 30,
              color: Colors.white,
            ),
          ),
          SizedBox(height: kDefaultVerticalPadding / 2),
          Text(
            item.title,
            style: Theme.of(context)
                .textTheme
                .bodyText1!
                .copyWith(color: Colors.white),
          ),
           SizedBox(height: kDefaultVerticalPadding),
        ],
      ),
    );
  }
}
