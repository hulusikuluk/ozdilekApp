import 'package:flutter/material.dart';

import '../../components/build_card.dart';
import '../../size_config.dart';

class HomeView extends StatefulWidget {
  const HomeView();
  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    final double itemHeight = getProportionateScreenHeight(350);
    final double itemWidth = getProportionateScreenWidth(250);
    var screenWidth = MediaQuery.of(context).size.width;
    return Column(
      children: [
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: GridView.count(
              crossAxisCount: screenWidth < 600 ? 2 : 4,
              childAspectRatio: (itemWidth / itemHeight),
              controller: new ScrollController(keepScrollOffset: false),
              shrinkWrap: true,
              scrollDirection: Axis.vertical,
              children: [
                ListTile(
                  title: Text(
                    "Test",
                    style: TextStyle(color: Colors.black),
                  ),
                ),
                ListTile(
                  title: Text(
                    "Test",
                    style: TextStyle(color: Colors.black),
                  ),
                ),
                ListTile(
                  title: Text(
                    "Test",
                    style: TextStyle(color: Colors.black),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
