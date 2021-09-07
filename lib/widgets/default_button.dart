import 'package:flutter/material.dart';
import 'package:store_app/constantas.dart';

class DefaultButton extends StatelessWidget {
  const DefaultButton({
    Key? key,
    this.text,
    this.onPressed,
  }) : super(key: key);
  final String? text;
  final Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      style: TextButton.styleFrom(
        backgroundColor: kPrimaryColor,
        shape: const RoundedRectangleBorder(borderRadius: BorderRadius.zero),
      ),
      child: Padding(
        padding:  EdgeInsets.symmetric(vertical: kDefaultVerticalPadding / 1.2),
        child: Text(
          text!,
          style: Theme.of(context)
              .textTheme
              .bodyText1!
              .copyWith(color: Colors.white),
        ),
      ),
    );
  }
}
