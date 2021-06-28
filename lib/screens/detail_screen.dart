import 'package:flutter/material.dart';
import 'package:ozdilek_app/constants.dart';

class DetailScreen extends StatelessWidget {
  static String routeName = "/detail";

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        appBar: AppBar(
            centerTitle: true,
            title: Text(
              'Ürün Adı',
              style: TextStyle(color: kPrimaryColor),
            )),
        body: Container(
          child: Center(
            child: Text('Nabersin'),
          ),
        ),
      ),
    );
  }
}
