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
                    List<Product> productList = asyncSnapshot.data;
                    return BuildListView(productList: productList);
                  }
                }
              }),
        ],
      ),
    );
  }
}

class BuildListView extends StatefulWidget {
  const BuildListView({
    Key key,
    @required this.productList,
  }) : super(key: key);

  final List<Product> productList;

  @override
  _BuildListViewState createState() => _BuildListViewState();
}

class _BuildListViewState extends State<BuildListView> {
  bool isFiltering = false;
  List<Product> filteredList;
  @override
  Widget build(BuildContext context) {
    var fullList = widget.productList;
    return Flexible(
      child: Column(
        children: [
          Container(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: TextField(
                onChanged: (query) {
                  if (query.isNotEmpty) {
                    isFiltering = true;

                    setState(() {
                      filteredList = fullList
                          .where((product) => product.Name.toLowerCase()
                              .contains(query.toLowerCase()))
                          .toList();
                    });
                  } else {
                    setState(() {
                      isFiltering = false;
                    });
                  }
                },
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
          ),
          Flexible(
            child: ListView.builder(
              itemCount: isFiltering ? filteredList.length : fullList.length,
              itemBuilder: (context, index) {
                var list = isFiltering ? filteredList : fullList;
                return Container(
                  child: Card(
                    child: ListTile(
                      title: Text(
                        list[index].Name,
                        style: TextStyle(color: Colors.black),
                      ),
                      subtitle: Text(list[index].Product_code),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
