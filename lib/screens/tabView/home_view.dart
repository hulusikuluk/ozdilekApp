import 'package:flutter/material.dart';
import 'package:ozdilek_app/screens/detail_screen.dart';
import 'package:ozdilek_app/size_config.dart';

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
                buildCard(),
                buildCard(),
                buildCard(),
                buildCard(),
                buildCard(),
                buildCard(),
                buildCard(),
                buildCard(),
                buildCard(),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Card buildCard() {
    return Card(
      child: InkWell(
        key: UniqueKey(),
        onTap: () {
          Navigator.pushNamed(context, DetailScreen.routeName);
        },
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Image.network(
                  'https://www.parlak.com.tr/UserFiles/Fotograflar/thumbs/39847-ozdilek-trendy-a-lila-salyaka-bornoz-s-m-17559-jpg-ozdilek-trendy-a-lila-salyaka-bornoz-s-m-17559.jpg'),
              SizedBox(
                height: getProportionateScreenHeight(10),
              ),
              Text(
                'Özdilek Trendy A.Lila Şalyaka Bornoz S/M',
                style: TextStyle(
                  fontSize: getProportionateScreenWidth(11),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
