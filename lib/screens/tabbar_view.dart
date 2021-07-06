import 'dart:io';

import 'package:flutter/material.dart';
import 'package:ozdilek_app/constants.dart';
import 'package:ozdilek_app/screens/drawer/drawer_view.dart';
import 'package:ozdilek_app/size_config.dart';
import 'tabView/home_view.dart';
import 'tabView/search_view.dart';

class MainTabbarView extends StatefulWidget {
  static String routeName = "/";
  String kategori;
  String katName;
  int index;
  MainTabbarView({this.kategori, this.katName, this.index});
  @override
  _MainTabbarViewState createState() => _MainTabbarViewState();
}

class _MainTabbarViewState extends State<MainTabbarView> {
  get kategori => widget.kategori;
  get katName => widget.katName;
  get index => widget.index;
  int defaultTabLength = 4;
  int currentIndex = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    if (kategori != null) {
      setState(() {
        currentIndex = 1;
      });
    }
    if (index != null) {
      setState(() {
        currentIndex = 1;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: defaultTabLength,
        initialIndex: currentIndex,
        child: Scaffold(
          drawer: Drawer(
            child: DrawerView(),
          ),
          bottomNavigationBar: _bottomAppBar,
          body: SafeArea(
            child: Column(
              children: <Widget>[
                _containerAppBar,
                Expanded(
                  child: TabBarView(
                    children: <Widget>[
                      HomeView(),
                      SearchView(kategori: kategori, katName: katName),
                      Text("Tab 3"),
                      Text("Tab 4"),
                    ],
                  ),
                )
              ],
            ),
          ),
        ));
  }

  Widget get _bottomAppBar => BottomAppBar(
        child: _tabBarItems,
        shape: CircularNotchedRectangle(),
        notchMargin: 8,
      );

  Widget get _containerAppBar => AnimatedContainer(
        duration: Duration(milliseconds: 500),
        height: 55,
        child: _appBar,
      );
  Widget get _appBar => AppBar(
        // leading: Icon(Icons.grid_view, size: 36.0, color: kPrimaryColor),
        title: Text(
          'Özdilek Ürünleri',
          style: TextStyle(
              fontSize: getProportionateScreenWidth(20), color: kPrimaryColor),
        ),
        centerTitle: true,
        elevation: 0,
      );

  Widget get _tabBarItems => TabBar(
        isScrollable: false,
        onTap: (index) {
          setState(() {
            currentIndex = index;
          });
        },
        tabs: [
          Tab(icon: Icon(Icons.home)),
          Tab(icon: Icon(Icons.search)),
          Tab(icon: Icon(Icons.ac_unit_outlined)),
          Tab(icon: Icon(Icons.safety_divider)),
        ],
      );
}
