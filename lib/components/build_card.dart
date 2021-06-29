import 'package:flutter/material.dart';
import 'package:ozdilek_app/screens/productView/product_model.dart';
import 'package:ozdilek_app/screens/productView/product_view.dart';
import 'package:ozdilek_app/size_config.dart';

class BuildCard extends StatelessWidget {
  final Product product;
  const BuildCard({Key key, this.product}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    String resimYok =
        'https://www.parlak.com.tr/UserFiles/Fotograflar/thumbs/41021-no-image-parlak-png-no-image-parlak.png';
    return Card(
      child: InkWell(
        key: UniqueKey(),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ProductView(
                product: product,
              ),
            ),
          );
        },
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Image.network(
                '${product.Image1}',
                errorBuilder: (BuildContext context, Object exception,
                    StackTrace stackTrace) {
                  return Text(resimYok);
                },
              ),
              SizedBox(
                height: getProportionateScreenHeight(10),
              ),
              Text(
                '${product.Name}',
                style: TextStyle(
                  fontSize: getProportionateScreenWidth(11),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
