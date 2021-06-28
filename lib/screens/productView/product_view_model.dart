import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../../core/database.dart';
import 'product_model.dart';

class ProductViewModel extends ChangeNotifier {
  //productview'in state bilgisini tutmak
  //productview arayüzünün ihtiyacı olduğu hesapları ve metodları yapmak
  //gerekli servislerle konuşmak

  Database _database = Database();

  Stream<List<Product>> getProductList() {
    const String productRef = "Products";

    /// stream<QuerySnapshot> --> Stream<List<DocumentSnapshot>>
    Stream<List<DocumentSnapshot>> streamListDocument = _database
        .getProductListFromApi(productRef)
        .map((querySnapshot) => querySnapshot.docs);

    ///Stream<List<DocumentSnapshot>> --> Stream<List<Product>>

    Stream<List<Product>> streamListProduct = streamListDocument.map(
        (listOfDocSnap) => listOfDocSnap
            .map((docSnap) => Product.fromMap(docSnap.data() as Map))
            .toList());
    return streamListProduct;
  }

  getProduct() {
    const String productRef = "Products";

    var products = _database.getProductListFromApi(productRef);
    var product = products.map((querySnap) => querySnap.docs
        .map((qds) => Product.fromMap(qds.data() as Map))
        .toList());
    var son = product.map((event) => event[27297].Name);

    return son.map((event) => event);
  }
}
