// To parse this JSON data, do
//
//     final productDetailModel = productDetailModelFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

ProductDetailModel productDetailModelFromJson(String str) => ProductDetailModel.fromJson(json.decode(str));

String productDetailModelToJson(ProductDetailModel data) => json.encode(data.toJson());

class ProductDetailModel {
  ProductDetailModel({
    required this.id,
    required this.name,
    required this.image,
    required this.description,
    required this.delivery,
    required this.price,
    required this.size,
    required this.sizeId,
  });

  String id;
  String name;
  String image;
  String description;
  String delivery;
  String price;
  String size;
  String sizeId;

  factory ProductDetailModel.fromJson(Map<String, dynamic> json) => ProductDetailModel(
    id: json["id"],
    name: json["name"],
    image: json["image"],
    description: json["description"],
    delivery: json["delivery"],
    price: json["price"],
    size: json["size"],
    sizeId: json["size_id"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "image": image,
    "description": description,
    "delivery": delivery,
    "price": price,
    "size": size,
    "size_id": sizeId,
  };
}
