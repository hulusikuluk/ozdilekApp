import 'package:flutter/material.dart';
import 'package:ozdilek_app/constants.dart';

class SearchView extends StatefulWidget {
  @override
  _SearchViewState createState() => _SearchViewState();
}

class _SearchViewState extends State<SearchView> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
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
        ),
      ],
    );
  }
}
