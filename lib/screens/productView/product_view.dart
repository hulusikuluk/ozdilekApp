import 'package:flutter/material.dart';
import 'package:ozdilek_app/constants.dart';
import 'package:ozdilek_app/screens/productView/product_model.dart';
import 'package:ozdilek_app/screens/productView/product_view_model.dart';
import 'package:provider/provider.dart';

class ProductView extends StatelessWidget {
  static String routeName = "/detail";
  final Product product;

  const ProductView({Key key, this.product}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<ProductViewModel>(
      create: (_) => ProductViewModel(),
      builder: (context, child) => Container(
        child: Scaffold(
          appBar: AppBar(
              centerTitle: true,
              title: Text(
                'Özdilek Ürünleri',
                style: TextStyle(color: kPrimaryColor),
              )),
          body: Container(
            child: Center(
              child: Text('${product.Name}'),
            ),
          ),
        ),
      ),
    );
  }
}
