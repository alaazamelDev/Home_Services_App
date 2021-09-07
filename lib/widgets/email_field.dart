import 'package:flutter/material.dart';
import 'package:store_app/constantas.dart';

class EmailField extends StatelessWidget {
  const EmailField({
    Key? key,
    required this.hint,
  }) : super(key: key);
  final String hint;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      cursorColor: kDarkGreyColor,
      decoration: InputDecoration(
        contentPadding:  EdgeInsets.symmetric(
          horizontal: kDefaultHorizontalPadding,
          vertical: kDefaultVerticalPadding,
        ),
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.zero,
          borderSide: BorderSide.none,
        ),
        filled: true,
        fillColor: kLightGreyColor.withOpacity(0.3),
        hintText: hint,
        hintStyle: Theme.of(context)
            .textTheme
            .bodyText2!
            .copyWith(color: kHintTextColor),
      ),
      style: Theme.of(context).textTheme.bodyText1!.copyWith(
            color: kBodyTextColor,
            overflow: TextOverflow.ellipsis,
          ),
      maxLines: 1,
    );
  }
}
