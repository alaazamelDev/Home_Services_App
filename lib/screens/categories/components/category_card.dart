import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:store_app/constantas.dart';
import 'package:store_app/models/categroy.dart';
import 'package:store_app/responsive.dart';

class CategoryCard extends StatelessWidget {
  const CategoryCard({
    Key? key,
    required this.category,
  }) : super(key: key);
  final Category category;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: kDefaultVerticalPadding),
      height: Responsive.getScreenHeight(context: context) * 0.1,
      decoration: BoxDecoration(
        border: Border.all(
          width: 0.5,
          color: kLightGreyColor,
        ),
      ),
      child: Row(
        children: [
          Expanded(
            flex: 1,
            child: Container(
              padding: EdgeInsets.symmetric(
                vertical: kDefaultVerticalPadding * 1.3,
                horizontal: kDefaultHorizontalPadding * 1.3,
              ),
              height: double.infinity,
              color: kDarkGreyColor.withOpacity(0.3),
              child: SvgPicture.asset(category.icon),
            ),
          ),
          Expanded(
            flex: 2,
            child: Padding(
              padding: EdgeInsets.only(left: kDefaultHorizontalPadding),
              child: Text(
                category.name,
                style: Theme.of(context).textTheme.subtitle2!.copyWith(
                      color: kBodyTextColor,
                      fontWeight: FontWeight.w500,
                    ),
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: RotationTransition(
              turns: const AlwaysStoppedAnimation(180 / 360),
              child: SvgPicture.asset('assets/icons/back.svg'),
            ),
          ),
        ],
      ),
    );
  }
}
