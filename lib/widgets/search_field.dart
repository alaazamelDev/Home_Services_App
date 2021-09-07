import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:store_app/constantas.dart';

class SearchField extends StatelessWidget {
  const SearchField({
    Key? key,
    this.onChanged,
  }) : super(key: key);
  final Function(String)? onChanged;

  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: onChanged,
      decoration: InputDecoration(
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.zero,
          borderSide: BorderSide.none,
        ),
        filled: true,
        fillColor: kDarkGreyColor.withOpacity(0.3),
        contentPadding: EdgeInsets.symmetric(
          horizontal: kDefaultHorizontalPadding,
          vertical: kDefaultVerticalPadding,
        ),
        prefixIcon: Icon(
          Icons.search_rounded,
          size: ScreenUtil().setHeight(30),
          color: Colors.grey,
        ),
        hintText: 'Search by category',
        hintStyle: Theme.of(context)
            .textTheme
            .bodyText1!
            .copyWith(color: kHintTextColor),
      ),
      style: Theme.of(context).textTheme.bodyText1!.copyWith(
            color: kBodyTextColor,
            overflow: TextOverflow.ellipsis,
          ),
      cursorColor: kDarkGreyColor,
      maxLines: 1,
    );
  }
}
