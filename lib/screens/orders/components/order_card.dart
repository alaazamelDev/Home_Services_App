import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:store_app/constantas.dart';
import 'package:store_app/models/work.dart';


class OrderCard extends StatelessWidget {
  const OrderCard({
    Key? key,
    required this.work,
    required this.onItemPressed,
  }) : super(key: key);
  final Work work;
  final Function(Work) onItemPressed;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onItemPressed(work);
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            height: ScreenUtil().setHeight(Random().nextInt(20) % 2 == 0 ? 300 : 200),
            color: kAccentColor.withOpacity(0.3),
          ),
          SizedBox(height: ScreenUtil().setHeight(10)),
          Text(
            work.name,
            style: Theme.of(context).textTheme.headline6,
          ),
          SizedBox(height: ScreenUtil().setHeight(10)),
          Text(
            work.price.toString(),
            style: Theme.of(context)
                .textTheme
                .headline6!
                .copyWith(color: kDarkGreyColor),
          ),
        ],
      ),
    );
  }
}
