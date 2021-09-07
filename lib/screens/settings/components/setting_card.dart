import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:store_app/constantas.dart';


class SettingCard extends StatelessWidget {
  const SettingCard({
    Key? key,
    required this.name,
    required this.onItemSelected,
  }) : super(key: key);
  final String name;
  final Function(String) onItemSelected;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onItemSelected(name);
      },
      child: Container(
        margin: EdgeInsets.symmetric(vertical: kDefaultVerticalPadding / 2),
        padding: EdgeInsets.symmetric(
          vertical: kDefaultVerticalPadding * 1.5,
          horizontal: kDefaultHorizontalPadding,
        ),
        color: kLightGreyColor.withOpacity(0.4),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              name,
              style: Theme.of(context).textTheme.bodyText1,
            ),
            RotatedBox(
              quarterTurns: 90,
              child: SvgPicture.asset('assets/icons/back.svg'),
            ),
          ],
        ),
      ),
    );
  }
}
