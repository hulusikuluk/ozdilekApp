import 'package:flutter/material.dart';
import '../../core/database.dart';

class HomeView extends StatefulWidget {
  const HomeView();
  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    Database _database = Database();
    Future veriOku() async {
      var datam = await _database
          .getProductCollection("categories")
          .doc("527")
          .collection("527")
          .get()
          .then((value) => value.docs);
      datam.forEach((element) {
        print(element["title"]);
      });
    }

    veriOku();
    return Column(
      children: [
        Expanded(child: Text('Hulusi')),
      ],
    );
  }
}
