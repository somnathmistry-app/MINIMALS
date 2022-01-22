// To parse this JSON data, do
//
//     final sizeModel = sizeModelFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

SizeModel sizeModelFromJson(String str) => SizeModel.fromJson(json.decode(str));

String sizeModelToJson(SizeModel data) => json.encode(data.toJson());

class SizeModel {
  SizeModel({
    required this.sizes,
  });

  List<Sizes> sizes;

  factory SizeModel.fromJson(Map<String, dynamic> json) => SizeModel(
    sizes: List<Sizes>.from(json["Sizes"].map((x) => Sizes.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "Sizes": List<dynamic>.from(sizes.map((x) => x.toJson())),
  };
}

class Sizes {
  Sizes({
    required this.id,
    required this.name,
  });

  String id;
  String name;

  factory Sizes.fromJson(Map<String, dynamic> json) => Sizes(
    id: json["id"],
    name: json["name"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
  };
}
