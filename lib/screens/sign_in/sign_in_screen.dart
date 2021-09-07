// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:store_app/constantas.dart';
import 'package:store_app/widgets/scaled_image.dart';
import 'package:store_app/screens/sign_in/components/signin_form.dart';
import 'package:store_app/widgets/social_bar.dart';
import 'package:store_app/screens/sign_up/components/screen_appbar.dart';
import 'package:store_app/screens/sign_up/signup_screen.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: ScreenAppBar(
        title: 'Sign In',
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
              vertical: kDefaultVerticalPadding / 2,
              horizontal: kDefaultHorizontalPadding,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                SizedBox(height: ScreenUtil().setHeight(16)),
                ScaledImage(image: kIllustrationSignIn),
                SizedBox(height: ScreenUtil().setHeight(36)),
                SignInForm(
                  onSignInPressed: () {
                    Navigator.pushReplacementNamed(context, '/home');
                  },
                ),
                SizedBox(height: ScreenUtil().setHeight(10)),
                Text(
                  'or',
                  style: Theme.of(context).textTheme.bodyText1,
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: ScreenUtil().setHeight(10)),
                const SocialBar(),
                SizedBox(height: ScreenUtil().setHeight(45)),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Don\'t have an account?',
                      style: Theme.of(context)
                          .textTheme
                          .bodyText1!
                          .copyWith(color: kDarkGreyColor),
                    ),
                    SizedBox(width: kDefaultHorizontalPadding / 2),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => SignUpScreen(),
                          ),
                        );
                      },
                      child: Text(
                        'Sign Up',
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
