import 'package:flutter/material.dart';
import 'package:ozdilek_app/constants.dart';
import 'package:ozdilek_app/screens/productView/product_model.dart';
import 'package:ozdilek_app/screens/productView/product_view_model.dart';
import 'package:provider/provider.dart';

class SearchView extends StatefulWidget {
  @override
  _SearchViewState createState() => _SearchViewState();
}

class _SearchViewState extends State<SearchView> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<ProductViewModel>(
      create: (_) => ProductViewModel(),
      builder: (context, child) => Column(
        children: [
          buildTextField(),
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
                    List<Product>? productList = asyncSnapshot.data;
                    return Flexible(
                      child: ListView.builder(
                        itemCount: productList!.length,
                        itemBuilder: (context, index) {
                          return Container(
                            child: Card(
                              child: ListTile(
                                title: Text(productList[index].Name),
                                subtitle: Text(productList[index].Product_code),
                              ),
                            ),
                          );
                        },
                      ),
                    );
                  }
                }
              }),
        ],
      ),
    );
  }

  Container buildTextField() {
    return Container(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: TextField(
          decoration: InputDecoration(
            prefixIcon: Icon(
              Icons.search,
              color: Colors.white,
            ),
            hintText: "Ürünler içinde ara...",
            hintStyle: TextStyle(color: Colors.white),
            fillColor: kPrimaryColor,
            filled: true,
            suffixIcon: Container(
              padding: EdgeInsets.all(7.0),
              child: PhysicalShape(
                color: kPrimaryColor,
                shadowColor: Colors.black,
                elevation: 3,
                clipper: ShapeBorderClipper(
                  shape: CircleBorder(),
                ),
              ),
            ),
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(40),
                borderSide: BorderSide.none),
          ),
        ),
      ),
    );
  }
}
