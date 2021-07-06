import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'constants.dart';
import 'screens/productView/product_view.dart';
import 'screens/productView/product_view_model.dart';
import 'screens/splash_screen.dart';
import 'screens/tabbar_view.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Provider<ProductViewModel>(
      create: (context) => ProductViewModel(),
      child: MaterialApp(
        title: 'Özdilek Mağazalar',
        debugShowCheckedModeBanner: false,
        initialRoute: SplashScreen.routeName,
        routes: {
          SplashScreen.routeName: (context) => SplashScreen(),
          MainTabbarView.routeName: (context) => MainTabbarView(),
          ProductView.routeName: (context) => ProductView(),
        },
        theme: ThemeData.light().copyWith(
          visualDensity: VisualDensity.adaptivePlatformDensity,
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
      ),
    );
  }
}
