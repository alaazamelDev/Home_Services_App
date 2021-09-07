import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:store_app/models/categroy.dart';
import 'package:store_app/models/menu_item.dart';
import 'package:store_app/models/message.dart';
import 'package:store_app/models/onboarding_item.dart';
import 'package:store_app/models/screens_enum.dart';
import 'package:store_app/models/work.dart';

const Color kPrimaryColor = Color(0xFF20C3AF);
const Color kSecondaryColor = Color(0xFF525464);
const Color kAccentColor = Color(0xFFFFB19D);
const Color kCardsColor = Color(0xFFB0B0C3);
const Color kLightGreyColor = Color(0xFFCBD3D5);
const Color kDarkGreyColor = Color(0xFFB5C3C7);
const Color kBodyGreyColor = Color(0xFF525464);
const Color kMenuItemColor = Color(0xFF323440);
const Color kButtonTextColor = Color(0xFFFFFFFF);
const Color kTitleTextColor = Color(0xFF525464);
const Color kBodyTextColor = Color(0xFF838391);
const Color kHintTextColor = Color(0xFFB0B0C3);

const Color kCardStartGradiantColor = Color(0xFF02DA80);
const Color kCardEndGradiantColor = Color(0xFF0284D8);

//default padding
double kDefaultVerticalPadding = ScreenUtil().setHeight(20.0);
double kDefaultHorizontalPadding = ScreenUtil().setWidth(20.0);

//images
const String kIllustrationSignIn = 'assets/images/Illustration_sign_in.png';
const String kIllustrationSignUp = 'assets/images/Illustration_sign_up.png';
const String kOnboarding1 = 'assets/images/onboarding1.png';
const String kOnboarding2 = 'assets/images/onboarding2.png';
const String kOnboarding3 = 'assets/images/onboarding3.png';
const String kOnboarding4 = 'assets/images/onboarding4.png';
const String kPerson1 = 'assets/images/person1.png';
const String kPerson2 = 'assets/images/person2.png';
const String kPerson3 = 'assets/images/person3.png';
const String kPerson4 = 'assets/images/person4.png';

//box decoration object for animated Screens
var activityBoxDecoration = BoxDecoration(
  boxShadow: [
    BoxShadow(
      color: Colors.black.withOpacity(0.4),
      spreadRadius: 3,
      blurRadius: 8,
      offset: const Offset(0, 3), // changes position of shadow
    ),
  ],
);

//Keys used for route data passing
const String kActivityTitleKey = 'activityKey';

List<OnBoardingItem> onboardingList = <OnBoardingItem>[
  OnBoardingItem(
      image: kOnboarding1,
      title: 'Proven\nSpecialists',
      description: 'We check each specialiest before\nhe starts work'),
  OnBoardingItem(
      image: kOnboarding2,
      title: 'Honest\nratings',
      description:
          'We carefully check each specialist\nand put honest ratings'),
  OnBoardingItem(
      image: kOnboarding3,
      title: 'Insured\norders',
      description: 'We insure each order for the\namount of \$500'),
  OnBoardingItem(
      image: kOnboarding4,
      title: 'Create\norder',
      description: 'it\'s easy, just click on the plus'),
];

List<Category> categoriesList = <Category>[
  Category(icon: 'assets/icons/furniture_works.svg', name: 'Furniture works'),
  Category(
      icon: 'assets/icons/cleaning_service.svg', name: 'Cleaning services'),
  Category(icon: 'assets/icons/equipment_repair.svg', name: 'Equipment repair'),
  Category(icon: 'assets/icons/courier_service.svg', name: 'Courier service'),
  Category(icon: 'assets/icons/interior_design.svg', name: 'Interior design'),
];

List<MenuItem> menuItems = [
  MenuItem(
    icon: Icons.home,
    title: 'Home',
    isSelected: true,
    type: ScreenType.home,
  ),
  MenuItem(
    icon: Icons.person,
    title: 'Profile',
    isSelected: false,
    type: ScreenType.profile,
  ),
  MenuItem(
    icon: Icons.settings,
    title: 'Settings',
    isSelected: false,
    type: ScreenType.settings,
  ),
  MenuItem(
    icon: Icons.email,
    title: 'Messages',
    isSelected: false,
    type: ScreenType.messages,
  ),
];

List<Message> messagesList = [
  Message(
    personName: 'Joel Rowe',
    companyName: 'Bitrow Company',
    content:
        'Sorry, all the artists in the Interior Design category are busy right now. If your task is still relevant - go to the task details page and click "Extend task”.',
    avatar: 'assets/images/person1.png',
  ),
  Message(
    personName: 'Cole Payne',
    companyName: 'Corporation Kraton',
    content:
        'We have found a contractor for your task "Cleaning services”. Please see the details.',
    avatar: 'assets/images/person2.png',
  ),
  Message(
    personName: 'Elva Stone',
    companyName: 'Grand Service Company',
    content:
        'David Coleman is ready to complete your assignment and get started soon! View David\'s profile and carefully review the order details. Then confirm the order.',
    avatar: 'assets/images/person3.png',
  ),
];

List<Work> worksList = [
  Work(name: 'Welding works', isSelected: false, price: 24),
  Work(name: 'Foundation works', isSelected: false, price: 60),
  Work(name: 'Roofing', isSelected: false, price: 42),
  Work(name: 'Waterproofing', isSelected: false, price: 56),
  Work(name: 'Architecture', isSelected: false, price: 19),
  Work(name: 'Balcony repair', isSelected: false, price: 35),
  Work(name: 'Redecorating', isSelected: false, price: 46),
  Work(name: 'Painting works', isSelected: false, price: 98),
  Work(name: 'Interior design', isSelected: false, price: 72),
  Work(name: 'Redecorating', isSelected: false, price: 57),
  Work(name: 'TV maintinance', isSelected: false, price: 23),
];

List<String> settingsList = [
  'Payment cards',
  'Write to us',
  'Rate us on app store',
  'About us',
];
