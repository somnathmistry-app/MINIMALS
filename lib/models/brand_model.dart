// To parse this JSON data, do
//
//     final brandsModel = brandsModelFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

BrandsModel brandsModelFromJson(String str) => BrandsModel.fromJson(json.decode(str));

String brandsModelToJson(BrandsModel data) => json.encode(data.toJson());

class BrandsModel {
  BrandsModel({
    required this.brands,
  });

  List<Brand> brands;

  factory BrandsModel.fromJson(Map<String, dynamic> json) => BrandsModel(
    brands: List<Brand>.from(json["brands"].map((x) => Brand.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "brands": List<dynamic>.from(brands.map((x) => x.toJson())),
  };
}

class Brand {
  Brand({
    required this.id,
    required this.name,
    required this.description,
    required this.image,
  });

  String id;
  String name;
  String description;
  String image;

  factory Brand.fromJson(Map<String, dynamic> json) => Brand(
    id: json["id"],
    name: json["name"],
    description: json["description"],
    image: json["image"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "description": description,
    "image": image,
  };
}
