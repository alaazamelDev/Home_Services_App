// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:store_app/constantas.dart';
import 'package:store_app/widgets/default_button.dart';
import 'package:store_app/widgets/email_field.dart';
import 'package:store_app/widgets/password_field.dart';

class SignInForm extends StatelessWidget {
  const SignInForm({
    Key? key, required this.onSignInPressed,
  }) : super(key: key);
  final Function() onSignInPressed;
  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const EmailField(hint: 'Username'),
          SizedBox(height: kDefaultVerticalPadding),
          PasswordField(
            hint: 'Password',
          ),
          SizedBox(height: kDefaultVerticalPadding),
          GestureDetector(
            onTap: () {
              // go to reset password activity
            },
            child: Align(
              alignment: AlignmentDirectional.centerEnd,
              child: Text(
                'Forgot your passwoed?',
                style: Theme.of(context).textTheme.bodyText1,
              ),
            ),
          ),
          SizedBox(height: ScreenUtil().setHeight(45)),
          DefaultButton(
            text: 'Login',
            onPressed: onSignInPressed,
          ),
        ],
      ),
    );
  }
}
