import 'package:flutter/material.dart';
import 'package:ozdilek_app/screens/productView/product_view.dart';
import 'package:ozdilek_app/size_config.dart';

class BuildCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      child: InkWell(
        key: UniqueKey(),
        onTap: () {
          Navigator.pushNamed(context, ProductView.routeName);
        },
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Image.network(
                  'https://www.parlak.com.tr/UserFiles/Fotograflar/thumbs/39847-ozdilek-trendy-a-lila-salyaka-bornoz-s-m-17559-jpg-ozdilek-trendy-a-lila-salyaka-bornoz-s-m-17559.jpg'),
              SizedBox(
                height: getProportionateScreenHeight(10),
              ),
              Text(
                'Özdilek Trendy A.Lila Şalyaka Bornoz S/M',
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
