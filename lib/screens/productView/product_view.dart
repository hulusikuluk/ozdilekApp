import 'package:flutter/material.dart';
import 'package:ozdilek_app/constants.dart';
import 'package:ozdilek_app/screens/productView/product_view_model.dart';
import 'package:provider/provider.dart';

class ProductView extends StatelessWidget {
  static String routeName = "/detail";

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<ProductViewModel>(
      create: (_) => ProductViewModel(),
      builder: (context, child) => Container(
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
      ),
    );
  }
}
