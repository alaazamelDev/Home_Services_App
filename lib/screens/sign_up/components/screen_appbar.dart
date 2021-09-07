import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:store_app/constantas.dart';


class ScreenAppBar extends StatelessWidget implements PreferredSizeWidget {
  const ScreenAppBar({
    Key? key,
    required this.title,
    required this.onBackPressed,
    required this.onMenuPressed,
  }) : super(key: key);
  final String title;
  final Function() onBackPressed;
  final Function() onMenuPressed;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0.0,
      centerTitle: true,
      title: Text(
        title,
        style: Theme.of(context).textTheme.headline6,
      ),
      leading: IconButton(
        onPressed: onBackPressed,
        icon: SvgPicture.asset('assets/icons/back.svg'),
        splashRadius: kDefaultVerticalPadding,
      ),
      actions: [
        IconButton(
          onPressed: onMenuPressed,
          icon: SvgPicture.asset('assets/icons/menu.svg'),
          splashRadius: kDefaultVerticalPadding,
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(60);
}
