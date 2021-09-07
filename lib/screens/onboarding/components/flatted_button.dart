import 'package:flutter/material.dart';
import 'package:store_app/constantas.dart';

class FlattedButton extends StatelessWidget {
  const FlattedButton({
    Key? key,
    required this.onPressed,
  }) : super(key: key);
  final Function() onPressed;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.symmetric(horizontal: kDefaultHorizontalPadding),
      child: TextButton(
        onPressed: onPressed,
        style: ButtonStyle(
          shape: MaterialStateProperty.all(
            const RoundedRectangleBorder(
              borderRadius: BorderRadius.zero,
            ),
          ),
          backgroundColor: MaterialStateProperty.all<Color>(kPrimaryColor),
        ),
        child: Padding(
          padding:  EdgeInsets.symmetric(vertical: kDefaultVerticalPadding / 1.2),
          child: Text(
            'Next',
            style: Theme.of(context)
                .textTheme
                .bodyText1!
                .copyWith(color: Colors.white),
          ),
        ),
      ),
    );
  }
}
