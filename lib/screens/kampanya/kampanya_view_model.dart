import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/widgets.dart';
import 'package:ozdilek_app/core/database.dart';

import 'kampanya_model.dart';

class KampanyaViewModel extends ChangeNotifier {
  Database _database = Database();

  Stream<List<Kampanya>> getKampanyaList() {
    const String productRef = "kampanya";

    /// stream<QuerySnapshot> --> Stream<List<DocumentSnapshot>>
    Stream<List<DocumentSnapshot>> streamListDocument = _database
        .getProductListFromApi(productRef)
        .map((querySnapshot) => querySnapshot.docs);

    ///Stream<List<DocumentSnapshot>> --> Stream<List<Product>>
    Stream<List<Kampanya>> streamListKampanya = streamListDocument.map(
        (listOfDocSnap) => listOfDocSnap
            .map((docSnap) => Kampanya.fromMap(docSnap.data() as Map))
            .toList());
    return streamListKampanya;
  }
}
