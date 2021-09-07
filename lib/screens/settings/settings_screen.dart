import 'package:flutter/material.dart';
import 'package:store_app/constantas.dart';
import 'package:store_app/screens/settings/components/setting_card.dart';
import 'package:store_app/screens/sign_up/components/screen_appbar.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({Key? key, this.onBackPressed}) : super(key: key);
  final Function()? onBackPressed;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ScreenAppBar(
        title: 'Settings',
        onBackPressed: () {
          onBackPressed!();
        },
        onMenuPressed: () {},
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(
          vertical: kDefaultVerticalPadding,
          horizontal: kDefaultHorizontalPadding,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: List.generate(
                  settingsList.length,
                  (index) => SettingCard(
                        name: settingsList[index],
                        onItemSelected: (item) {},
                      )),
            ),
            TextButton(
              onPressed: () {},
              child: Text(
                'Log Out',
                style: Theme.of(context).textTheme.bodyText1!.copyWith(
                    color: kAccentColor,
                    decoration: TextDecoration.underline),
              ),
            )
          ],
        ),
      ),
    );
  }
}
