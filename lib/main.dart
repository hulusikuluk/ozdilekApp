import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ozdilek_app/screens/detail_screen.dart';
import 'constants.dart';
import 'screens/splash_screen.dart';
import 'screens/tabbar_view.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Özdilek Mağazalar',
      debugShowCheckedModeBanner: false,
      initialRoute: SplashScreen.routeName,
      routes: {
        SplashScreen.routeName: (context) => SplashScreen(),
        MainTabbarView.routeName: (context) => MainTabbarView(),
        DetailScreen.routeName: (context) => DetailScreen(),
      },
      theme: ThemeData.light().copyWith(
        appBarTheme: AppBarTheme(
          color: Colors.white,
          iconTheme: IconThemeData(color: kPrimaryColor),
        ),
        textTheme: TextTheme(
          bodyText1: TextStyle(color: kPrimaryColor),
          bodyText2: TextStyle(color: Colors.black87),
        ),
        tabBarTheme: TabBarTheme(
            labelColor: kPrimaryColor,
            unselectedLabelColor: CupertinoColors.inactiveGray),
      ),
    );
  }
}
