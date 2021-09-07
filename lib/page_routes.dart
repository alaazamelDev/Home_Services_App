// ignore_for_file: prefer_const_constructors
import 'package:store_app/models/screens_enum.dart';
import 'package:store_app/screens/add_card/addcard_screen.dart';
import 'package:store_app/screens/available_cards/availablecards_screen.dart';
import 'package:store_app/screens/categories/categories_screen.dart';
import 'package:store_app/screens/home/home_screen.dart';
import 'package:store_app/screens/messages/messages_screen.dart';
import 'package:store_app/screens/onboarding/onboarding_screen.dart';
import 'package:store_app/screens/orders/orders_screen.dart';
import 'package:store_app/screens/payment/payment_screen.dart';
import 'package:store_app/screens/profile/profile_screen.dart';
import 'package:store_app/screens/selected_work/selected_work.dart';
import 'package:store_app/screens/sign_in/sign_in_screen.dart';

class PageRoutes {
  late ScreenType type;
  String? getRoute(ScreenType type) {
    switch (type) {
      case ScreenType.home:
        return '/home';
      case ScreenType.profile:
        return '/profile';
      case ScreenType.messages:
        return '/messages';
      case ScreenType.settings:
        return '/settings';
    }
  }

  static var routes = {
    '/home': (context) => HomeScreen(),
    '/onboarding': (context) => OnBoardingScreen(),
    '/signin': (context) => SignInScreen(),
    '/categories': (context) => CategoriesScreen(),
    '/orders_screen': (context) => OrdersScreen(),
    '/profile': (context) => ProfileScreen(),
    '/messages': (context) => MessagesScreen(),
    '/selected': (context) => SelectedWork(),
    '/payment': (context) => PaymentScreen(),
    '/add_card': (context) => AddCardScreen(),
    '/show_cards': (context) => AvailableCardsScreen(),
  };
}
