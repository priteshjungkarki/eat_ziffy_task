// To parse this JSON data, do
//
//     final categoriesModel = categoriesModelFromJson(jsonString);

import 'dart:convert';

List<CategoriesModel> categoriesModelFromJson(String str) =>
    List<CategoriesModel>.from(
        json.decode(str).map((x) => CategoriesModel.fromJson(x)));

String categoriesModelToJson(List<CategoriesModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class CategoriesModel {
  CategoriesModel({
    this.id,
    this.category,
    this.totalBookmarked,
  });

  int id;
  String category;
  int totalBookmarked;

  factory CategoriesModel.fromJson(Map<String, dynamic> json) =>
      CategoriesModel(
        id: json["id"],
        category: json["category"],
        totalBookmarked: json["total_bookmarked"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "category": category,
        "total_bookmarked": totalBookmarked,
      };
}
