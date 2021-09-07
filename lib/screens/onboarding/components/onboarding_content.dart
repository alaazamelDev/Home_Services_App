import 'package:flutter/material.dart';
import 'package:store_app/models/onboarding_item.dart';


class OnboardingContent extends StatelessWidget {
  const OnboardingContent({
    Key? key,
    required this.item,
  }) : super(key: key);
  final OnBoardingItem item;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Spacer(),
        Text(
          item.title,
          style: Theme.of(context).textTheme.headline3,
          textAlign: TextAlign.center,
        ),
        const Spacer(),
        AspectRatio(
          aspectRatio: 1.4,
          child: Image.asset(item.image),
        ),
        const Spacer(),
        Text(
          item.description,
          style: Theme.of(context).textTheme.bodyText1,
          textAlign: TextAlign.center,
        ),
        const Spacer(),
      ],
    );
  }
}
