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
        Expanded(
          child: Stack(
            children: [
              Container(color: kPrimaryColor),
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(88),
                  ),
                ),
              ),
            ],
          ),
        ),
        Container(
          height: 200,
          child: Stack(
            children: [
              Container(color: Colors.white),
              Container(
                decoration: BoxDecoration(
                  color: kPrimaryColor,
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(88),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
