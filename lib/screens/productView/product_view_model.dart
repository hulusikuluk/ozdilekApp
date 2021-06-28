import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../../core/database.dart';
import 'product_model.dart';

class ProductViewModel extends ChangeNotifier {
  //productview'in state bilgisini tutmak
  //productview arayüzünün ihtiyacı olduğu hesapları ve metodları yapmak
  //gerekli servislerle konuşmak

  Database _database = Database();

  getProductList() {
    const String productRef = "Products";

    /// stream<QuerySnapshot> --> Stream<List<DocumentSnapshot>>
    Stream<List<DocumentSnapshot>> streamListDocument = _database
        .getProductListFromApi(productRef)
        .map((querySnapshot) => querySnapshot.docs);

    ///Stream<List<DocumentSnapshot>> --> Stream<List<Product>>

    var streamListProduct = streamListDocument.map((listOfDocSnap) =>
        listOfDocSnap.map((docSnap) => Product.fromMap(docSnap.data() as Map)));
    return streamListProduct;
  }
}
