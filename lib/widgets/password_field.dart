import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:store_app/constantas.dart';

class PasswordField extends StatefulWidget {
  const PasswordField({
    Key? key,
    required this.hint,
  }) : super(key: key);

  final String hint;

  @override
  State<PasswordField> createState() => _PasswordFieldState();
}

class _PasswordFieldState extends State<PasswordField> {
  bool _isObsecured = true;
  void togglePasswordState() {
    setState(() {
      _isObsecured = !_isObsecured;
    });
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      cursorColor: kDarkGreyColor,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.symmetric(
          horizontal: kDefaultHorizontalPadding,
          vertical: kDefaultVerticalPadding,
        ),
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.zero,
          borderSide: BorderSide.none,
        ),
        suffixIcon: IconButton(
          icon: Icon(
            _isObsecured ? Icons.visibility_off : Icons.visibility,
            color: kDarkGreyColor,
            size: ScreenUtil().setHeight(25),
          ),
          splashRadius: ScreenUtil().setHeight(20),
          onPressed: () {
            togglePasswordState();
          },
        ),
        filled: true,
        fillColor: kLightGreyColor.withOpacity(0.3),
        hintText: widget.hint,
        hintStyle: Theme.of(context)
            .textTheme
            .bodyText2!
            .copyWith(color: kHintTextColor),
      ),
      style: Theme.of(context).textTheme.bodyText1!.copyWith(
            color: kBodyTextColor,
            overflow: TextOverflow.ellipsis,
          ),
      obscureText: _isObsecured,
      maxLines: 1,
    );
  }
}
