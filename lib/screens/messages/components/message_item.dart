import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:store_app/constantas.dart';
import 'package:store_app/models/message.dart';

class MessageItem extends StatelessWidget {
  const MessageItem({Key? key, required this.item}) : super(key: key);
  final Message item;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: kDefaultVerticalPadding),
      child: Column(
        children: [
          Material(
            child: ListTile(
              leading: CircleAvatar(
                radius: ScreenUtil().setHeight(25),
                backgroundImage: AssetImage(item.avatar!),
              ),
              tileColor: Colors.white,
              title: Text(
                item.personName!,
                style: Theme.of(context).textTheme.bodyText1!.copyWith(
                      color: kBodyGreyColor,
                      fontWeight: FontWeight.w600,
                    ),
              ),
              subtitle: Text(
                item.companyName!,
                style: Theme.of(context).textTheme.bodyText1,
              ),
            ),
          ),
          SizedBox(height: kDefaultVerticalPadding * 0.25),
          Padding(
            padding:
                EdgeInsets.symmetric(horizontal: kDefaultHorizontalPadding),
            child: Text(
              item.content!,
              style:
                  Theme.of(context).textTheme.bodyText2!.copyWith(height: 1.8),
            ),
          )
        ],
      ),
    );
  }
}
