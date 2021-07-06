import 'package:flutter/material.dart';
import 'package:ozdilek_app/screens/tabbar_view.dart';
import 'package:provider/provider.dart';

import '../../components/build_card.dart';
import '../../constants.dart';
import '../../size_config.dart';
import '../productView/product_model.dart';
import '../productView/product_view_model.dart';

class SearchView extends StatefulWidget {
  String kategori;
  String katName;
  SearchView({this.kategori, this.katName});
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
                    String kategori = widget.kategori;
                    String katName = widget.katName;
                    return BuildListView(
                        productList: productList,
                        kategori: kategori,
                        katName: katName);
                  }
                }
              }),
        ],
      ),
    );
  }
}

class BuildListView extends StatefulWidget {
  BuildListView({
    Key key,
    @required this.productList,
    String this.kategori,
    String this.katName,
  }) : super(key: key);

  final List<Product> productList;
  String kategori;
  String katName;

  @override
  _BuildListViewState createState() => _BuildListViewState();
}

class _BuildListViewState extends State<BuildListView> {
  bool isFiltering = false;
  List<Product> filteredList;
  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    var fullList = widget.productList;
    String kategori = widget.kategori;
    String katName = widget.katName;
    if (kategori != null && isFiltering == false) {
      fullList = fullList
          .where((product) => product.subCategory_id.contains(kategori))
          .toList();
    } else {
      fullList = widget.productList;
    }
    return Flexible(
      child: Column(
        children: [
          Container(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 50),
              child: Container(
                margin: EdgeInsets.only(top: getProportionateScreenHeight(10)),
                height: getProportionateScreenHeight(50),
                child: TextField(
                  onChanged: (query) {
                    if (query.isNotEmpty) {
                      isFiltering = true;
                      setState(() {
                        filteredList = fullList
                            .where((product) => product.Name.toLowerCase()
                                .contains(query.toLowerCase()))
                            .toList();
                        filteredList.addAll(fullList
                            .where((product) =>
                                product.Product_code.toLowerCase()
                                    .contains(query.toLowerCase()))
                            .toList());
                      });
                    } else {
                      // WidgetsBinding.instance.focusManager.primaryFocus.unfocus();
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
                    contentPadding: EdgeInsets.all(0),
                    hintText: "Ürünler içinde ara...",
                    hintStyle: TextStyle(color: Colors.white),
                    fillColor: kPrimaryColor,
                    filled: true,
                    suffixIcon: Container(
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
                        borderRadius: BorderRadius.circular(25),
                        borderSide: BorderSide.none),
                  ),
                ),
              ),
            ),
          ),
          katName != null
              ? Center(
                  child: InkWell(
                    onTap: () {
                      setState(() {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    MainTabbarView(index: 1)));
                      });
                    },
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 40),
                      child: ListTile(
                        title: Text(
                          '$katName',
                          style: TextStyle(color: Colors.grey),
                        ),
                        trailing: Icon(Icons.close),
                      ),
                    ),
                  ),
                )
              : Center(),
          Flexible(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: screenWidth < 600 ? 2 : 4,
                  crossAxisSpacing: 0,
                  mainAxisSpacing: 0,
                  childAspectRatio: 2,
                  mainAxisExtent: getProportionateScreenHeight(280),
                ),
                itemBuilder: (context, index) {
                  var list = isFiltering ? filteredList : fullList;
                  return BuildCard(
                    product: list[index],
                  );
                },
                itemCount: isFiltering ? filteredList.length : fullList.length,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
