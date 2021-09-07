import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:store_app/constantas.dart';
import 'package:store_app/screens/sign_up/components/screen_appbar.dart';
import 'package:store_app/widgets/default_button.dart';

class AvailableCardsScreen extends StatelessWidget {
  const AvailableCardsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ScreenAppBar(
        title: 'Payment cards',
        onBackPressed: () {
          if (Navigator.canPop(context)) Navigator.pop(context);
        },
        onMenuPressed: () {},
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(
          vertical: kDefaultVerticalPadding,
          horizontal: kDefaultHorizontalPadding,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Column(
              children: List.generate(
                4,
                (index) => buildCardDetailsItem(
                  context: context,
                  card: 'assets/images/card_${Random().nextInt(2) + 1}.png',
                ),
              ),
            ),
            const Spacer(),
            DefaultButton(
              text: 'Add new Card',
              onPressed: () {
                Navigator.pushNamed(context, '/add_card');
              },
            ),
          ],
        ),
      ),
    );
  }

  Container buildCardDetailsItem(
      {required BuildContext context, required String card}) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: kDefaultVerticalPadding / 2),
      padding: EdgeInsets.symmetric(
        vertical: kDefaultVerticalPadding,
        horizontal: kDefaultHorizontalPadding,
      ),
      decoration: BoxDecoration(
        border: Border.all(
          width: 1,
          color: kLightGreyColor,
        ),
      ),
      child: Row(
        children: [
          Image.asset(
            card,
            width: ScreenUtil().setWidth(70),
            height: ScreenUtil().setHeight(50),
          ),
          SizedBox(width: kDefaultHorizontalPadding),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '•••• •••• ••••  3872',
                style: Theme.of(context).textTheme.bodyText2!.copyWith(
                      color: kTitleTextColor,
                      letterSpacing: 1.5,
                    ),
              ),
              SizedBox(height: kDefaultVerticalPadding / 4),
              Text(
                '17 / 2020',
                style: Theme.of(context).textTheme.bodyText2,
              ),
            ],
          )
        ],
      ),
    );
  }
}
