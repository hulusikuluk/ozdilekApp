import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../../core/database.dart';
import 'drawer_model.dart';

class DrawerViewModel extends ChangeNotifier {
  Database _database = Database();

  Stream<List<DrawerMenuModel>> getProductList() {
    const String productRef = "categories";

    /// stream<QuerySnapshot> --> Stream<List<DocumentSnapshot>>
    Stream<List<DocumentSnapshot>> streamListDocument = _database
        .getProductListFromApi(productRef)
        .map((querySnapshot) => querySnapshot.docs);

    ///Stream<List<DocumentSnapshot>> --> Stream<List<Product>>
    Stream<List<DrawerMenuModel>> streamListProduct = streamListDocument.map(
        (listOfDocSnap) => listOfDocSnap
            .map((docSnap) => DrawerMenuModel.fromMap(docSnap.data() as Map))
            .toList());
    return streamListProduct;
  }

  Stream<List<DrawerMenuModel>> getSubProductList(String id) {
    const String productRef = "categories";
    Stream<List<DocumentSnapshot>> streamListDocument = _database
        .getSubProductListFromApi(productRef, id)
        .map((event) => event.docs);
    Stream<List<DrawerMenuModel>> streamListProduct = streamListDocument.map(
        (listOfDocSnap) => listOfDocSnap
            .map((docSnap) => DrawerMenuModel.fromMap(docSnap.data() as Map))
            .toList());
    return streamListProduct;
  }

  getSubProductListFromApi(String id) {}
}
