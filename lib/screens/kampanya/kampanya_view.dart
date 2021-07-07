import 'package:flutter/material.dart';
import 'package:ozdilek_app/screens/productView/product_model.dart';
import 'package:ozdilek_app/screens/productView/product_view_model.dart';
import 'package:provider/provider.dart';

class KampanyaView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<ProductViewModel>(
      create: (_) => ProductViewModel(),
      builder: (context, child) => Column(
        children: [
          StreamBuilder<List<Product>>(
              stream: Provider.of<ProductViewModel>(context, listen: false)
                  .getProductList(),
              builder: (context, asyncSnapshot) {
                if (asyncSnapshot.hasError) {
                  print("*************");
                  print(asyncSnapshot.error);
                  return Center(child: Text("Bir Hata Oluştu"));
                } else {
                  if (!asyncSnapshot.hasData) {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  } else {
                    return Container();
                  }
                }
              }),
        ],
      ),
    );
  }
}
