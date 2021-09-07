import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:store_app/constantas.dart';

class InformationCard extends StatelessWidget {
  const InformationCard({
    Key? key,
    required this.icon,
    required this.title,
    required this.content,
  }) : super(key: key);
  final String icon;
  final String title;
  final String content;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(
            color: kLightGreyColor,
            width: 0.5,
          ),
        ),
        padding: EdgeInsets.symmetric(vertical: kDefaultVerticalPadding * 0.6),
        child: Row(
          children: [
            Expanded(
              flex: 1,
              child: SvgPicture.asset(icon),
            ),
            Container(
              height: MediaQuery.of(context).size.height * 0.07,
              width: 0.5,
              color: kLightGreyColor,
            ),
            Expanded(
              flex: 3,
              child: Container(
                padding: EdgeInsets.only(left: kDefaultHorizontalPadding),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(title, style: Theme.of(context).textTheme.bodyText2),
                    SizedBox(height: ScreenUtil().setHeight(2)),
                    Text(
                      content,
                      style: Theme.of(context)
                          .textTheme
                          .bodyText1!
                          .copyWith(color: Colors.white),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
