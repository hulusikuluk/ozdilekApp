import 'package:cloud_firestore/cloud_firestore.dart';

class Database {
  FirebaseFirestore _firestore = FirebaseFirestore.instance;

  //Firestore servisinden ürünler verisini stream olarak almak

  CollectionReference<Map<String, dynamic>> getProductCollection(
      String referancePath) {
    return _firestore.collection(referancePath);
  }

  Stream<QuerySnapshot> getProductListFromApi(String referancePath) {
    return _firestore.collection(referancePath).snapshots();
  }

  Stream<QuerySnapshot> getSubProductListFromApi(
      String referancePath, String docPath) {
    return _firestore
        .collection(referancePath)
        .doc(docPath)
        .collection(docPath)
        .snapshots();
  }
}
