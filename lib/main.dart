import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ozdilek_app/screens/productView/product_view.dart';
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
        ProductView.routeName: (context) => ProductView(),
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
