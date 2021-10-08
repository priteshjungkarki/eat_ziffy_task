// To parse this JSON data, do
//
//     final labelItems = labelItemsFromJson(jsonString);

import 'dart:convert';

List<LabelItems> labelItemsFromJson(String str) =>
    List<LabelItems>.from(json.decode(str).map((x) => LabelItems.fromJson(x)));

String labelItemsToJson(List<LabelItems> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class LabelItems {
  LabelItems({
    this.image,
    this.title,
    this.isFavorite,
    this.isBookmarked,
    this.labelId,
    this.catId,
    this.id,
  });

  String image;
  String title;
  bool isFavorite;
  bool isBookmarked;
  int labelId;
  int catId;
  int id;

  factory LabelItems.fromJson(Map<String, dynamic> json) => LabelItems(
        image: json["image"],
        title: json["title"],
        isFavorite: json["isFavorite"],
        isBookmarked: json["isBookmarked"],
        labelId: json["labelId"],
        catId: json["catId"],
        id: json["id"],
      );

  Map<String, dynamic> toJson() => {
        "image": image,
        "title": title,
        "isFavorite": isFavorite,
        "isBookmarked": isBookmarked,
        "labelId": labelId,
        "catId": catId,
        "id": id,
      };
}
