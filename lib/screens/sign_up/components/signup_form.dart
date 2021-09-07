// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:store_app/constantas.dart';
import 'package:store_app/widgets/default_button.dart';
import 'package:store_app/widgets/email_field.dart';
import 'package:store_app/widgets/password_field.dart';

class SignUpForm extends StatefulWidget {
  const SignUpForm({Key? key}) : super(key: key);

  @override
  _SignUpFormState createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          EmailField(
            hint: 'Enter email',
            key: widget.key,
          ),
          SizedBox(height: kDefaultVerticalPadding),
          PasswordField(
            hint: 'Enter password',
            key: widget.key,
          ),
          SizedBox(height: kDefaultVerticalPadding),
          PasswordField(
            hint: 'Confirm password',
            key: widget.key,
          ),
          SizedBox(height: kDefaultVerticalPadding),
          DefaultButton(
            text: 'Sign Up',
            onPressed: () {
              //move to nex screen
              Fluttertoast.showToast(
                msg: 'Signed up successfully',
                toastLength: Toast.LENGTH_SHORT,
                backgroundColor: Colors.white.withOpacity(0.5),
                textColor: Colors.black54,
              );
            },
          ),
        ],
      ),
    );
  }
}
