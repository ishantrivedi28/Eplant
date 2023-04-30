enum Catogery { Plant, Pot }

class Product {
  String productId;
  Catogery catogery;
  String name;
  String price;
  String imgUrl;
  String description;

  Product(
      {required this.catogery,
      required this.description,
      required this.imgUrl,
      required this.name,
      required this.productId,
      required this.price});
}
