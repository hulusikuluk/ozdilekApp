import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import '../screens/productView/product_model.dart';
import '../screens/productView/product_view.dart';
import '../size_config.dart';

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
              CachedNetworkImage(
                placeholder: (context, url) => Center(
                    child: CircularProgressIndicator(
                  color: Colors.amber.shade900,
                )),
                imageUrl: '${product.Image1}',
                height: getProportionateScreenHeight(180),
                errorWidget: (context, url, error) {
                  return Image.network(
                    resimYok,
                    height: getProportionateScreenHeight(180),
                  );
                },
              ),
              SizedBox(
                height: getProportionateScreenHeight(10),
              ),
              Flexible(
                child: ListTile(
                  subtitle: Text(
                    '${product.Product_code}',
                    style: TextStyle(
                        color: Colors.grey,
                        fontSize: getProportionateScreenWidth(10)),
                  ),
                  title: Text(
                    '${product.Name}',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: getProportionateScreenWidth(11),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
