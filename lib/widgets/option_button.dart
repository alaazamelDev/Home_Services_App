import 'package:flutter/material.dart';
import 'package:store_app/constantas.dart';

class OptionButton extends StatelessWidget {
  const OptionButton({
    Key? key,
    required this.onPressed,
    required this.text,
    required this.color,
  }) : super(key: key);
  final Function() onPressed;
  final String text;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: TextButton(
        style: TextButton.styleFrom(
          backgroundColor: color,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.zero,
            side: color == Colors.white
                ? const BorderSide(
                    width: 0.5,
                    color: kLightGreyColor,
                  )
                : BorderSide.none,
          ),
        ),
        onPressed: onPressed,
        child: Padding(
          padding:
              EdgeInsets.symmetric(vertical: kDefaultVerticalPadding * 0.75),
          child: Text(
            text,
            style: Theme.of(context).textTheme.bodyText1!.copyWith(
                color: color == Colors.white ? kDarkGreyColor : Colors.white),
          ),
        ),
      ),
    );
  }
}
