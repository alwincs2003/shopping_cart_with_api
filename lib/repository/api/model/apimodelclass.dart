// To parse this JSON data, do
//
//     final apiarticles = apiarticlesFromJson(jsonString);

import 'dart:convert';

List<Apiarticles> apiarticlesFromJson(String str) => List<Apiarticles>.from(
    json.decode(str).map((x) => Apiarticles.fromJson(x)));

String apiarticlesToJson(List<Apiarticles> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Apiarticles {
  int? id;
  String? title;
  double? price;
  String? description;
  String? category;
  String? image;
  Rating? rating;

  Apiarticles({
    this.id,
    this.title,
    this.price,
    this.description,
    this.category,
    this.image,
    this.rating,
  });

  factory Apiarticles.fromJson(Map<String, dynamic> json) => Apiarticles(
        id: json["id"],
        title: json["title"],
        price: json["price"]?.toDouble(),
        description: json["description"],
        category: json["category"],
        image: json["image"],
        rating: json["rating"] == null ? null : Rating.fromJson(json["rating"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "price": price,
        "description": description,
        "category": category,
        "image": image,
        "rating": rating?.toJson(),
      };
}

class Rating {
  double? rate;
  int? count;

  Rating({
    this.rate,
    this.count,
  });

  factory Rating.fromJson(Map<String, dynamic> json) => Rating(
        rate: json["rate"]?.toDouble(),
        count: json["count"],
      );

  Map<String, dynamic> toJson() => {
        "rate": rate,
        "count": count,
      };
}
