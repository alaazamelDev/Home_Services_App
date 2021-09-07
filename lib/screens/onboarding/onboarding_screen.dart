import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:store_app/constantas.dart';
import 'package:store_app/screens/onboarding/components/flatted_button.dart';
import 'package:store_app/screens/onboarding/components/onboarding_content.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({Key? key}) : super(key: key);

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  _setOnboardingInfo() async {
    bool isViewed = true;
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool('onBoard', isViewed);
  }

  final PageController _controller = PageController(initialPage: 0);
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SizedBox(
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                flex: 5,
                child: PageView.builder(
                  controller: _controller,
                  onPageChanged: (index) {
                    setState(() {
                      currentIndex = index;
                    });
                  },
                  itemCount: onboardingList.length,
                  itemBuilder: (context, index) => OnboardingContent(
                    item: onboardingList[index],
                  ),
                ),
              ),
              Expanded(
                flex: 2,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(
                        onboardingList.length,
                        (index) => buildDot(index: index),
                      ),
                    ),
                    const Spacer(),
                    currentIndex == onboardingList.length - 1
                        ? FloatingActionButton(
                            backgroundColor: kPrimaryColor,
                            child: const Icon(
                              Icons.add,
                              color: Colors.white,
                            ),
                            onPressed: () async {
                              await _setOnboardingInfo();
                              Navigator.pushReplacementNamed(
                                  context, '/signin');
                            },
                          )
                        : FlattedButton(onPressed: () {
                            setState(() {
                              if (currentIndex != onboardingList.length - 1) {
                                _controller.nextPage(
                                  duration: const Duration(milliseconds: 750),
                                  curve: Curves.ease,
                                );
                              }
                            });
                          }),
                    const Spacer(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Container buildDot({required int index}) {
    return Container(
      margin: const EdgeInsets.only(right: 8),
      width: index == currentIndex ? 18 : 8,
      height: 8,
      decoration: BoxDecoration(
        color: index == currentIndex ? kSecondaryColor : kDarkGreyColor,
        borderRadius: BorderRadius.circular(5),
      ),
    );
  }
}
