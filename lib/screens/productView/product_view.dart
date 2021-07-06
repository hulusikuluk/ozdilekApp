import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:ozdilek_app/constants.dart';
import 'package:ozdilek_app/screens/productView/product_model.dart';
import 'package:ozdilek_app/screens/productView/product_view_model.dart';
import 'package:ozdilek_app/size_config.dart';
import 'package:provider/provider.dart';
import 'package:transparent_image/transparent_image.dart';

class ProductView extends StatelessWidget {
  static String routeName = "/detail";
  final Product product;

  const ProductView({Key key, this.product}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    var resimler = [
      product.Image1,
      product.Image2,
      product.Image3,
      product.Image4,
      product.Image5
    ];
    var kampanyalar = [
      {
        "icon": Icon(
          Icons.local_shipping_outlined,
          size: getProportionateScreenWidth(35),
          color: Colors.grey.shade300,
        ),
        "text": "Ücretsiz Kargo"
      },
      {
        "icon": Icon(
          Icons.thumb_up_alt_outlined,
          size: getProportionateScreenWidth(35),
          color: Colors.grey.shade300,
        ),
        "text": "Sağlam Ürün Garantisi"
      },
      {
        "icon": Icon(
          Icons.assignment_return_outlined,
          size: getProportionateScreenWidth(35),
          color: Colors.grey.shade300,
        ),
        "text": "14 Gün İçinde Koşulsuz İdade"
      },
      {
        "icon": Icon(
          Icons.favorite,
          size: getProportionateScreenWidth(40),
          color: Colors.grey.shade300,
        ),
        "text": "Hediye Paketi"
      },
    ];
    resimler.removeWhere((value) => value == null);
    double fiyat =
        double.parse(product.Price3) * (double.parse(product.Tax) / 100 + 1);

    return ChangeNotifierProvider<ProductViewModel>(
      create: (_) => ProductViewModel(),
      builder: (context, child) => Container(
        child: Scaffold(
          appBar: AppBar(
              centerTitle: true,
              title: Text(
                'Özdilek Ürünleri',
                style: TextStyle(color: kPrimaryColor),
              )),
          body: ListView(
            children: [
              buildCarouselSlider(resimler),
              buildTitle(),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          padding: EdgeInsets.all(5),
                          margin: EdgeInsets.only(
                              bottom: getProportionateScreenHeight(15)),
                          decoration: BoxDecoration(
                              color: Colors.grey.shade200,
                              borderRadius: BorderRadius.circular(15)),
                          child: Text(
                            '${(double.parse(product.Price).roundToDouble() - fiyat.roundToDouble())}0 ₺ İNDİRİMLE',
                            style: TextStyle(
                              color: Colors.green,
                            ),
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              '${double.parse(product.Price).roundToDouble()}0 ₺',
                              style: TextStyle(
                                  fontSize: getProportionateScreenWidth(18),
                                  fontWeight: FontWeight.w700,
                                  color: Colors.grey.shade600,
                                  decoration: TextDecoration.lineThrough),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 15),
                              child: Text(
                                '${fiyat.roundToDouble()}0 ₺',
                                style: TextStyle(
                                    fontSize: getProportionateScreenWidth(28),
                                    fontWeight: FontWeight.w500),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              buildKampanyalar(kampanyalar),
              SizedBox(
                height: getProportionateScreenHeight(10),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Expanded(
                      child: Html(
                        data: product.Description,
                        shrinkWrap: true,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Container buildTitle() {
    return Container(
      padding: EdgeInsets.all(getProportionateScreenHeight(10)),
      child: Center(
        child: Text('${product.Name}',
            style: TextStyle(fontSize: getProportionateScreenWidth(15))),
      ),
    );
  }

  CarouselSlider buildCarouselSlider(List<String> resimler) {
    return CarouselSlider(
      options: CarouselOptions(
        height: getProportionateScreenHeight(350),
        viewportFraction: 0.8,
        initialPage: 0,
        enableInfiniteScroll: true,
        reverse: false,
        autoPlay: resimler.length > 1 ? true : false,
        autoPlayInterval: Duration(seconds: 4),
        autoPlayAnimationDuration: Duration(milliseconds: 800),
        autoPlayCurve: Curves.fastOutSlowIn,
        enlargeCenterPage: true,
        scrollDirection: Axis.horizontal,
      ),
      items: resimler.map((i) {
        return Builder(
          builder: (BuildContext context) {
            return Container(
              width: MediaQuery.of(context).size.width,
              margin: EdgeInsets.symmetric(horizontal: 5.0),
              // decoration: BoxDecoration(color: Colors.amber),
              child: FadeInImage.memoryNetwork(
                image: '$i',
                placeholder: kTransparentImage,
              ),
            );
          },
        );
      }).toList(),
    );
  }

  Padding buildKampanyalar(List<Map<String, Object>> kampanyalar) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Container(
        height: getProportionateScreenWidth(101),
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: kampanyalar.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.all(2),
              child: Container(
                width: getProportionateScreenWidth(100),
                height: getProportionateScreenWidth(100),
                decoration: BoxDecoration(color: Colors.grey.shade100),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    kampanyalar.elementAt(index)["icon"],
                    SizedBox(
                      height: getProportionateScreenHeight(5),
                    ),
                    Text(
                      '${kampanyalar.elementAt(index)["text"]}',
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
