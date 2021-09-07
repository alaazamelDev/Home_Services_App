import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:store_app/constantas.dart';
import 'package:store_app/models/work.dart';
import 'package:store_app/responsive.dart';
import 'package:store_app/screens/sign_up/components/screen_appbar.dart';
import 'package:store_app/widgets/default_button.dart';

class PaymentScreen extends StatelessWidget {
  const PaymentScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    for (Work item in worksList) {
      item.isSelected = false;
    }
    List<Work> selectedItems =
        ModalRoute.of(context)!.settings.arguments as List<Work>;
    double total = 0;
    if (selectedItems.isNotEmpty) {
      for (var item in selectedItems) {
        total += item.price;
      }
    }
    return Scaffold(
      appBar: ScreenAppBar(
        title: 'Payment for services',
        onBackPressed: () {
          if (Navigator.canPop(context)) {
            Navigator.pop(context);
          }
        },
        onMenuPressed: () {},
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: kDefaultHorizontalPadding,
          vertical: kDefaultVerticalPadding / 2,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(
              height: Responsive.getScreenHeight(context: context) * 0.5,
              child: ListView.builder(
                itemCount: selectedItems.length,
                itemBuilder: (context, index) =>
                    PurchasedItem(item: selectedItems[index]),
              ),
            ),
            SizedBox(height: kDefaultVerticalPadding),
            const Divider(),
            SizedBox(height: kDefaultVerticalPadding / 2),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Total',
                  style: Theme.of(context)
                      .textTheme
                      .bodyText1!
                      .copyWith(color: kTitleTextColor.withOpacity(0.7)),
                ),
                Text(
                  '$total\$',
                  style: Theme.of(context)
                      .textTheme
                      .headline6!
                      .copyWith(fontSize: 30.sp),
                )
              ],
            ),
            const Spacer(),
            DefaultButton(
              text: 'Checkout',
              onPressed: () {
                Navigator.pushNamed(context, '/show_cards');
              },
            ),
            SizedBox(height: kDefaultVerticalPadding / 4),
            TextButton(
              onPressed: () {},
              child: Text(
                'Continue Shopping',
                style: Theme.of(context).textTheme.bodyText1!.copyWith(
                    color: kAccentColor, decoration: TextDecoration.underline),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class PurchasedItem extends StatelessWidget {
  const PurchasedItem({
    Key? key,
    required this.item,
  }) : super(key: key);
  final Work item;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: kDefaultVerticalPadding / 2),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            height: kDefaultVerticalPadding * 4,
            width: kDefaultVerticalPadding * 4,
            color: kLightGreyColor,
          ),
          SizedBox(width: kDefaultHorizontalPadding),
          Text(
            item.name,
            style: Theme.of(context)
                .textTheme
                .headline6!
                .copyWith(color: kTitleTextColor.withOpacity(0.7)),
          ),
          const Spacer(),
          Text(
            '${item.price}\$',
            style: Theme.of(context)
                .textTheme
                .headline6!
                .copyWith(fontSize: 30.sp),
          ),
        ],
      ),
    );
  }
}
