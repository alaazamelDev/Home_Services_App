// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:store_app/constantas.dart';
import 'package:store_app/screens/profile/components/information_card.dart';
import 'package:store_app/screens/sign_up/components/screen_appbar.dart';
import 'package:store_app/widgets/option_button.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key, this.onBackPressed}) : super(key: key);
  final Function()? onBackPressed;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ScreenAppBar(
        title: '',
        onBackPressed: () {
          onBackPressed!();
        },
        onMenuPressed: () {},
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: Container(
              color: Colors.white,
              padding: EdgeInsets.symmetric(
                vertical: kDefaultVerticalPadding / 2,
                horizontal: kDefaultHorizontalPadding,
              ),
              child: Column(
                children: [
                  CircleAvatar(
                      backgroundImage:
                          AssetImage('assets/images/person4.png'),
                      radius: ScreenUtil().setHeight(60)),
                  SizedBox(height: kDefaultVerticalPadding),
                  Text(
                    'Jeremías del Pozo',
                    style: Theme.of(context)
                        .textTheme
                        .headline3!
                        .copyWith(fontSize: 22.sp),
                  ),
                  SizedBox(height: kDefaultVerticalPadding / 2),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'New York',
                        style: Theme.of(context).textTheme.bodyText1,
                      ),
                      SizedBox(width: kDefaultHorizontalPadding / 2),
                      Container(
                        width: 5,
                        height: 5,
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(5)),
                          color: kDarkGreyColor,
                        ),
                      ),
                      SizedBox(width: kDefaultHorizontalPadding / 2),
                      Text(
                        'ID: 1120611',
                        style: Theme.of(context).textTheme.bodyText1,
                      ),
                    ],
                  ),
                  const Spacer(),
                  GestureDetector(
                    onTap: () {
                      //go to edit information
                    },
                    child: Text(
                      'Edit',
                      style: Theme.of(context).textTheme.bodyText1!.copyWith(
                            color: kAccentColor,
                            decoration: TextDecoration.underline,
                          ),
                    ),
                  ),
                  const Spacer(),
                  Row(
                    children: [
                      OptionButton(
                        onPressed: () {},
                        text: 'About Me',
                        color: Colors.white,
                      ),
                      SizedBox(width: kDefaultHorizontalPadding),
                      OptionButton(
                        onPressed: () {},
                        text: 'Reviews',
                        color: kPrimaryColor,
                      ),
                    ],
                  ),
                  const Spacer(),
                ],
              ),
            ),
          ),
          Expanded(
            child: Container(
              color: kBodyGreyColor,
              padding: EdgeInsets.symmetric(
                  horizontal: kDefaultHorizontalPadding,
                  vertical: kDefaultVerticalPadding * 2),
              child: Column(
                children: [
                  InformationCard(
                    title: 'Phone number',
                    content: '+3746589923',
                    icon: 'assets/icons/phone.svg',
                  ),
                  SizedBox(height: kDefaultVerticalPadding),
                  InformationCard(
                    title: 'Email',
                    content: 'conrad@gmail.com',
                    icon: 'assets/icons/email.svg',
                  ),
                  SizedBox(height: kDefaultVerticalPadding),
                  InformationCard(
                    title: 'Completed projects',
                    content: '248',
                    icon: 'assets/icons/completed.svg',
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
