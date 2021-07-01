class DrawerMenuModel {
  final String id;
  final String title;
  final String type;
  final String icon;

  DrawerMenuModel({this.id, this.title, this.type, this.icon});

//Objeden map oluşturan
  Map<String, dynamic> toMap() =>
      {"id": id, "title": title, "type": type, "icon": icon};

//mapTen obje oluşturan yapıcı
  factory DrawerMenuModel.fromMap(Map map) => DrawerMenuModel(
      id: map['id'], title: map['title'], type: map['type'], icon: map['icon']);
}
