import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:store_app/constantas.dart';

class SocialBar extends StatelessWidget {
  const SocialBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        buildSocialButton(icon: 'assets/icons/facebook.svg'),
        SizedBox(width: ScreenUtil().setWidth(8)),
        buildSocialButton(icon: 'assets/icons/twitter.svg'),
        SizedBox(width: ScreenUtil().setWidth(8)),
        buildSocialButton(icon: 'assets/icons/linkedin.svg'),
      ],
    );
  }

  Expanded buildSocialButton({required String icon}) {
    return Expanded(
      child: Material(
        child: InkWell(
          onTap: () {},
          child: Container(
            padding: EdgeInsets.symmetric(vertical: kDefaultVerticalPadding),
            decoration: BoxDecoration(
              border: Border.all(
                style: BorderStyle.solid,
                width: 1,
                color: kLightGreyColor,
              ),
            ),
            child: SvgPicture.asset(icon),
          ),
        ),
      ),
    );
  }
}
