// To parse this JSON data, do
//
//     final productsResponse = productsResponseFromMap(jsonString);

import 'dart:convert';

class ProductsResponse {
  ProductsResponse({
    this.data,
  });

  final List<Product> data;

  factory ProductsResponse.fromJson(String str) =>
      ProductsResponse.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory ProductsResponse.fromMap(Map<String, dynamic> json) =>
      ProductsResponse(
        data: List<Product>.from(json["data"].map((x) => Product.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "data": List<dynamic>.from(data.map((x) => x.toMap())),
      };
}

class Product {
  Product({
    this.id,
    this.attributes,
  });

  final int id;
  final Attributes attributes;

  factory Product.fromJson(String str) => Product.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Product.fromMap(Map<String, dynamic> json) => Product(
        id: json["id"],
        attributes: Attributes.fromMap(json["attributes"]),
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "attributes": attributes.toMap(),
      };
}

class Attributes {
  Attributes({
    this.name,
    this.price,
    this.description,
    this.createdAt,
    this.updatedAt,
    this.publishedAt,
    this.img,
  });

  final String name;
  final int price;
  final String description;
  final DateTime createdAt;
  final DateTime updatedAt;
  final DateTime publishedAt;
  final String img;

  factory Attributes.fromJson(String str) =>
      Attributes.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Attributes.fromMap(Map<String, dynamic> json) => Attributes(
        name: json["name"],
        price: json["price"],
        description: json["description"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        publishedAt: DateTime.parse(json["publishedAt"]),
        img: json["img"] == null ? null : json["img"],
      );

  Map<String, dynamic> toMap() => {
        "name": name,
        "price": price,
        "description": description,
      };
}
