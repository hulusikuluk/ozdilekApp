class Product {
  final String Product_code;
  final String Product_id;
  final String Name;
  final String mainCategory;
  final String mainCategory_id;
  final String category;
  final String category_id;
  final String subCategory;
  final String subCategory_id;
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
      {this.Product_code,
      this.Product_id,
      this.Name,
      this.mainCategory,
      this.mainCategory_id,
      this.category,
      this.category_id,
      this.subCategory,
      this.subCategory_id,
      this.Price,
      this.Price2,
      this.Price3,
      this.CurrencyType,
      this.Tax,
      this.Stock,
      this.Brand,
      this.Image1,
      this.Image2,
      this.Image3,
      this.Image4,
      this.Image5,
      this.Description});

  //Objeden map oluşturan
  Map<String, dynamic> toMap() => {
        "Product_code": Product_code,
        "Product_id": Product_id,
        "Name": Name,
        "mainCategory": mainCategory,
        "mainCategory_id": mainCategory_id,
        "category": category,
        "category_id": category_id,
        "subCategory": subCategory,
        "subCategory_id": subCategory_id,
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
      mainCategory: map['mainCategory'],
      mainCategory_id: map['mainCategory_id'],
      category: map['category'],
      category_id: map['category_id'],
      subCategory: map['subCategory'],
      subCategory_id: map['subCategory_id'],
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
