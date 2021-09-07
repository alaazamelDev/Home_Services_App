import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:store_app/constantas.dart';

class CridetCardWidget extends StatelessWidget {
  const CridetCardWidget({
    Key? key,
    this.cridet,
    this.expDate,
    this.width,
    this.height,
    this.lastDigits,
  }) : super(key: key);

  final double? cridet;
  final String? expDate;
  final double? width;
  final double? height;
  final String? lastDigits;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        vertical: kDefaultVerticalPadding,
        horizontal: kDefaultHorizontalPadding,
      ),
      height: height,
      width: width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(kDefaultVerticalPadding / 2),
        boxShadow: [
          BoxShadow(
            color: kDarkGreyColor.withOpacity(0.8),
            blurRadius: 5,
            spreadRadius: 3,
            offset: const Offset(0, 4),
          )
        ],
        gradient: const LinearGradient(
          colors: [
            kCardStartGradiantColor,
            kCardEndGradiantColor,
          ],
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                '••••',
                style: Theme.of(context)
                    .textTheme
                    .headline6!
                    .copyWith(color: Colors.white, letterSpacing: 5),
              ),
              SizedBox(width: kDefaultHorizontalPadding / 2),
              Text(
                lastDigits ?? '3872',
                style: Theme.of(context).textTheme.bodyText2!.copyWith(
                    color: Colors.white, letterSpacing: 1, fontSize: 20.sp),
              ),
              const Spacer(),
              Text(
                expDate ?? '08/24',
                style: Theme.of(context).textTheme.bodyText2!.copyWith(
                    color: Colors.white, letterSpacing: 1, fontSize: 20.sp),
              ),
            ],
          ),
          const Spacer(),
          Text(
            cridet != null ? '\$ $cridet' : '\$ 25.387',
            style: Theme.of(context)
                .textTheme
                .headline6!
                .copyWith(color: Colors.white, fontSize: 30.sp),
          )
        ],
      ),
    );
  }
}
