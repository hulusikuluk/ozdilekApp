class Kampanya {
  final String Product_id;

  Kampanya({this.Product_id});
  Map<String, dynamic> toMap() => {"Product_id": Product_id};

  factory Kampanya.fromMap(Map map) => Kampanya(Product_id: map['Product_id']);
}
