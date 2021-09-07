import 'package:flutter/material.dart';
import 'package:store_app/constantas.dart';
import 'package:store_app/responsive.dart';
import 'package:store_app/screens/messages/components/message_item.dart';
import 'package:store_app/screens/sign_up/components/screen_appbar.dart';
import 'package:store_app/widgets/default_button.dart';

class MessagesScreen extends StatelessWidget {
  const MessagesScreen({Key? key, this.onBackPressed}) : super(key: key);
  final Function()? onBackPressed;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ScreenAppBar(
        title: 'Messages',
        onBackPressed: () {
          onBackPressed!();
        },
        onMenuPressed: () {},
      ),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: kDefaultHorizontalPadding,
              vertical: kDefaultVerticalPadding / 2,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                SizedBox(
                  height: Responsive.getScreenHeight(context: context) * 0.71,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: List.generate(messagesList.length,
                        (index) => MessageItem(item: messagesList[index])),
                  ),
                ),
                SizedBox(height: kDefaultVerticalPadding),
                DefaultButton(
                  text: 'View all',
                  onPressed: () {
                    //Imepement View All functionality
                  },
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
