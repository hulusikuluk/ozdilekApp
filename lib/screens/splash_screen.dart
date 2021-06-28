import 'package:flutter/material.dart';
import 'package:ozdilek_app/screens/tabbar_view.dart';
import '../constants.dart';
import '../size_config.dart';

class SplashScreen extends StatelessWidget {
  static String routeName = "/splash";
  @override
  Widget build(BuildContext context) {
    // You have to call it on your starting screen
    SizeConfig().init(context);
    Image logo = Image.asset(
      'assets/images/ozdilekLogo.png',
      width: getProportionateScreenWidth(200),
    );
    return Scaffold(
      body: SizedBox.expand(
        child: Container(
          alignment: Alignment.center,
          decoration: BoxDecoration(
            gradient: kPrimaryGradientColor,
          ),
          child: Container(
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(20)),
            width: getProportionateScreenWidth(250),
            height: getProportionateScreenHeight(400),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: getProportionateScreenHeight(20),
                ),
                Expanded(child: logo),
                Text('www.parlak.com.tr'),
                SizedBox(
                  height: getProportionateScreenHeight(20),
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamedAndRemoveUntil(
                        context, MainTabbarView.routeName, (route) => false);
                  },
                  child: Text("Başla"),
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.resolveWith(getButtonColor),
                  ),
                ),
                SizedBox(
                  height: getProportionateScreenHeight(20),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
