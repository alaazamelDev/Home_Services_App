import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_statusbarcolor_ns/flutter_statusbarcolor_ns.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:store_app/constantas.dart';
import 'package:store_app/page_routes.dart';

bool? isViewed;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  isViewed = prefs.getBool('onBoard');

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // change the status bar color to material color [green-400]
    FlutterStatusbarcolor.setStatusBarColor(Colors.transparent);
    if (useWhiteForeground(Colors.white)) {
      FlutterStatusbarcolor.setStatusBarWhiteForeground(true);
    } else {
      FlutterStatusbarcolor.setStatusBarWhiteForeground(false);
    }
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      builder: () => MaterialApp(
        theme: ThemeData.light().copyWith(
          textTheme: TextTheme(
            headline3: GoogleFonts.ubuntu().copyWith(
              //for onboarding titles
              color: kTitleTextColor,
              fontSize: ScreenUtil().setSp(40),
              fontWeight: FontWeight.w400, //semibold light
            ),
            headline6: TextStyle(
              //for activity title
              fontFamily: 'Gilroy',
              fontSize: ScreenUtil().setSp(18),
              color: kTitleTextColor,
              fontWeight: FontWeight.w600, //semibold dark
            ),
            subtitle2: TextStyle(
              //for cards title
              fontFamily: 'Gilroy',
              fontSize: ScreenUtil().setSp(16),
              color: kBodyTextColor,
              fontWeight: FontWeight.w400,
            ),
            bodyText1: TextStyle(
              //for normal text
              fontFamily: 'Gilroy',
              fontSize: ScreenUtil().setSp(16),
              color: kBodyTextColor,
              fontWeight: FontWeight.w500, //medium
            ),
            bodyText2: TextStyle(
              //for normal text
              fontFamily: 'Gilroy',
              fontSize: ScreenUtil().setSp(14),
              color: kBodyTextColor,
              fontWeight: FontWeight.w500, //medium
            ),
          ),
          scaffoldBackgroundColor: Colors.white,
          hintColor: kHintTextColor,
          primaryColor: kPrimaryColor,
        ),
        debugShowCheckedModeBanner: false,
        routes: PageRoutes.routes,
        initialRoute:isViewed==true? '/home':'/onboarding',
      ),
    );
  }
}
