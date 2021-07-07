import 'package:flutter/material.dart';
import 'package:ozdilek_app/screens/kampanya/kampanya_view.dart';

class HomeView extends StatefulWidget {
  const HomeView();
  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            KampanyaView(),
            Text('Şuan demo APK kullanmaktasınız'),
            Text(
                'Sadece ürün arama,detay ve sol üstteki kategoriler kısmı yapıldı.'),
            Text('Sol kısımda açılır menü içinde kategoriler var.'),
            Text(
                'Arama kısmınıda hızlı şekilde aranacak, arama işlemi hem ürün isimleri, hemde ürün kodları için anlık olarak gerçekleşecek.'),
            Text('Resimler fade olarak zamanla yüklenip cash edilecek.'),
            Text(
                'kategori seçildiğinde seçilen kategori tab sekmede belirecek, liste arama yaparken genel ürünler üzerinden arama yapacak. Yazı silindiğinde tekrar kategori ismine göre liste görünecek. '),
            Text(
                'kategori ismi yanındaki X ya basıldığında kategoriden çıkılıp tüm ürünler listelenecek.'),
            Text(
                'Anasayfa slider, kampanyalar ve genel tasarım kısmını başlanacaktır.'),
          ],
        ),
      ),
    );
  }
}
