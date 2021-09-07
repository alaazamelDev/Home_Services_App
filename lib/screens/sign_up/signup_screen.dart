// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:store_app/constantas.dart';
import 'package:store_app/widgets/scaled_image.dart';
import 'package:store_app/widgets/social_bar.dart';
import 'package:store_app/screens/sign_up/components/screen_appbar.dart';
import 'package:store_app/screens/sign_up/components/signup_form.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ScreenAppBar(
        title: 'Sign Up',
        onBackPressed: () {
          if (Navigator.canPop(context)) {
            Navigator.pop(context);
          } else {
            SystemNavigator.pop();
          }
        },
        onMenuPressed: () {},
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(
              vertical: kDefaultVerticalPadding * 0.3,
              horizontal: kDefaultHorizontalPadding,
            ),
            child: Column(
              children: [
                SizedBox(height: ScreenUtil().setHeight(16)),
                ScaledImage(image: kIllustrationSignUp),
                SizedBox(height: ScreenUtil().setHeight(36)),
                SignUpForm(),
                SizedBox(height: ScreenUtil().setHeight(8)),
                Text(
                  'or',
                  style: Theme.of(context).textTheme.bodyText1,
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: ScreenUtil().setHeight(8)),
                SocialBar(),
                SizedBox(height: ScreenUtil().setHeight(40)),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Already have an account?',
                      style: Theme.of(context)
                          .textTheme
                          .bodyText1!
                          .copyWith(color: kDarkGreyColor),
                    ),
                    SizedBox(width: kDefaultHorizontalPadding / 2),
                    GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Text(
                        'Sign In',
                        style: Theme.of(context)
                            .textTheme
                            .bodyText1!
                            .copyWith(color: kAccentColor),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
