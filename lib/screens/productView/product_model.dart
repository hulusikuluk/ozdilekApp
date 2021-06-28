class Product {
  final String Product_code;
  final String Product_id;
  final String Name;
  final String MainCategory;
  final String MainCategory_id;
  final String Category;
  final String Category_id;
  final String SubCategory;
  final String SubCategory_id;
  final String Price;
  final String Price2;
  final String Price3;
  final String CurrencyType;
  final String Tax;
  final String Stock;
  final String Brand;
  final String Image1;
  final String Image2;
  final String Image3;
  final String Image4;
  final String Image5;
  final String Description;

  Product(
      {required this.Product_code,
      required this.Product_id,
      required this.Name,
      required this.MainCategory,
      required this.MainCategory_id,
      required this.Category,
      required this.Category_id,
      required this.SubCategory,
      required this.SubCategory_id,
      required this.Price,
      required this.Price2,
      required this.Price3,
      required this.CurrencyType,
      required this.Tax,
      required this.Stock,
      required this.Brand,
      required this.Image1,
      required this.Image2,
      required this.Image3,
      required this.Image4,
      required this.Image5,
      required this.Description});

  //Objeden map oluşturan
  Map<String, dynamic> toMap() => {
        "Product_code": Product_code,
        "Product_id": Product_id,
        "Name": Name,
        "MainCategory": MainCategory,
        "MainCategory_id": MainCategory_id,
        "Category": Category,
        "Category_id": Category_id,
        "SubCategory": SubCategory,
        "SubCategory_id": SubCategory_id,
        "Price": Price,
        "Price2": Price2,
        "Price3": Price3,
        "CurrencyType": CurrencyType,
        "Tax": Tax,
        "Stock": Stock,
        "Brand": Brand,
        "Image1": Image1,
        "Image2": Image2,
        "Image3": Image3,
        "Image4": Image4,
        "Image5": Image5,
        "Description": Description
      };

  //mapTen obje oluşturan yapıcı
  factory Product.fromMap(Map map) => Product(
      Product_code: map['Product_code'],
      Product_id: map['Product_id'],
      Name: map['Name'],
      MainCategory: map['MainCategory'],
      MainCategory_id: map['MainCategory_id'],
      Category: map['Category'],
      Category_id: map['Category_id'],
      SubCategory: map['SubCategory'],
      SubCategory_id: map['SubCategory_id'],
      Price: map['Price'],
      Price2: map['Price2'],
      Price3: map['Price3'],
      CurrencyType: map['CurrencyType'],
      Tax: map['Tax'],
      Stock: map['Stock'],
      Brand: map['Brand'],
      Image1: map['Image1'],
      Image2: map['Image2'],
      Image3: map['Image3'],
      Image4: map['Image4'],
      Image5: map['Image5'],
      Description: map['Description']);
}
