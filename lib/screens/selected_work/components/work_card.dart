import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:store_app/constantas.dart';
import 'package:store_app/models/work.dart';


class WorkCard extends StatelessWidget {
  const WorkCard({
    Key? key,
    required this.work,
    required this.onItemSelected,
  }) : super(key: key);
  final Work work;
  final Function(Work) onItemSelected;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onItemSelected(work);
      },
      child: Row(
        children: [
          Expanded(
            child: Container(
              padding: EdgeInsets.only(left: kDefaultHorizontalPadding),
              height: ScreenUtil().setHeight(70),
              margin:
                  EdgeInsets.symmetric(vertical: kDefaultVerticalPadding / 3),
              decoration: BoxDecoration(
                border: Border.all(
                  color: work.isSelected ? kAccentColor : kLightGreyColor,
                  width: 1.5,
                ),
              ),
              alignment: AlignmentDirectional.centerStart,
              child: Text(
                work.name,
                style: Theme.of(context).textTheme.bodyText1!.copyWith(
                    color: work.isSelected ? kTitleTextColor : kDarkGreyColor),
              ),
            ),
          ),
          Container(
            color: work.isSelected ? kAccentColor : kLightGreyColor,
            width: ScreenUtil().setHeight(70),
            height: ScreenUtil().setHeight(70),
            child: SvgPicture.asset(
              work.isSelected
                  ? 'assets/icons/check.svg'
                  : 'assets/icons/plus.svg',
              fit: BoxFit.scaleDown,
            ),
          ),
        ],
      ),
    );
  }
}
