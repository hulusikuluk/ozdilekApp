import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../colors.dart';
import '../../size_config.dart';
import 'drawer_model.dart';
import 'drawer_view_model.dart';

class DrawerView extends StatefulWidget {
  @override
  _DrawerViewState createState() => _DrawerViewState();
}

class _DrawerViewState extends State<DrawerView> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<DrawerViewModel>(
        create: (_) => DrawerViewModel(),
        builder: (context, child) => Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(
                    top: getProportionateScreenHeight(50),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Image.asset(
                        "assets/images/ozdilekLogo.png",
                        width: getProportionateScreenWidth(150),
                      ),
                    ],
                  ),
                ),
                StreamBuilder(
                  stream: Provider.of<DrawerViewModel>(context, listen: false)
                      .getProductList(),
                  builder: (context, asyncSnapshot) {
                    if (asyncSnapshot.hasError) {
                      return Center(child: Text("Bir Hata Oluştu"));
                    } else {
                      if (!asyncSnapshot.hasData) {
                        return Center(
                          child: CircularProgressIndicator(),
                        );
                      } else {
                        List<DrawerMenuModel> menuList = asyncSnapshot.data;
                        return BuildListView(menuList: menuList);
                      }
                    }
                  },
                ),
              ],
            ));
  }
}

class BuildListView extends StatefulWidget {
  const BuildListView({
    Key key,
    @required this.menuList,
  }) : super(key: key);

  final List<DrawerMenuModel> menuList;

  @override
  _BuildListViewState createState() => _BuildListViewState();
}

class _BuildListViewState extends State<BuildListView> {
  bool isFiltering = false;
  @override
  Widget build(BuildContext context) {
    var fullList = widget.menuList;

    return Expanded(
      child: ListView.builder(
        itemCount: fullList.length,
        itemBuilder: (context, index) {
          if (fullList[index].type == 'main') {
            return ListTile(
              title: Text(
                '${fullList[index].title}',
                style: TextStyle(color: colorDarkShade),
              ),
              leading: Icon(IconData(int.parse(fullList[index].icon),
                  fontFamily: 'MaterialIcons')),
              onTap: () {},
            );
            // Burada modele id yi gönderip bir döngü ile yeni ListTile ler döndüreceğim.
          } else {
            return ListTile(
              title: Text(
                '${fullList[index].title}',
                style: TextStyle(color: colorDarkShade),
              ),
              leading: Icon(IconData(int.parse(fullList[index].icon),
                  fontFamily: 'MaterialIcons')),
              onTap: () {},
            );
          }
        },
      ),
    );
  }
}
