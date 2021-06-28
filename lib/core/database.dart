import 'package:cloud_firestore/cloud_firestore.dart';

class Database {
  FirebaseFirestore _firestore = FirebaseFirestore.instance;

  //Firestore servisinden ürünler verisini stream olarak almak

  Stream<QuerySnapshot> getProductListFromApi(String referancePath) {
    return _firestore.collection(referancePath).snapshots();
  }
}
