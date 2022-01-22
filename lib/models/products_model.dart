// To parse this JSON data, do
//
//     final productsModel = productsModelFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

ProductsModel productsModelFromJson(String str) => ProductsModel.fromJson(json.decode(str));

String productsModelToJson(ProductsModel data) => json.encode(data.toJson());

class ProductsModel {
  ProductsModel({
    required this.products,
  });

  List<Product> products;

  factory ProductsModel.fromJson(Map<String, dynamic> json) => ProductsModel(
    products: List<Product>.from(json["products"].map((x) => Product.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "products": List<dynamic>.from(products.map((x) => x.toJson())),
  };
}

class Product {
  Product({
    required this.id,
    required this.name,
    required this.price,
    required this.size,
    required this.image,
  });

  String id;
  String name;
  String price;
  String size;
  String image;

  factory Product.fromJson(Map<String, dynamic> json) => Product(
    id: json["id"],
    name: json["name"],
    price: json["price"],
    size: json["size"],
    image: json["image"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "price": price,
    "size": size,
    "image": image,
  };
}
