import 'package:flutter/material.dart';
import 'package:ozdilek_app/colors.dart';
import 'package:ozdilek_app/size_config.dart';

class DrawerMenu extends StatelessWidget {
  const DrawerMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.only(
            top: getProportionateScreenHeight(50),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(
                "assets/images/ozdilekLogo.png",
                width: getProportionateScreenWidth(150),
              ),
            ],
          ),
        ),
        ListTile(
          title: Text(
            'Menü 1',
            style: TextStyle(color: colorDarkShade),
          ),
          leading: Icon(
            Icons.person,
          ),
          onTap: () {},
        ),
        ListTile(
          title: Text(
            'Menü 2',
            style: TextStyle(color: colorDarkShade),
          ),
          leading: Icon(
            Icons.person,
          ),
          onTap: () {},
        )
      ],
    );
  }
}
