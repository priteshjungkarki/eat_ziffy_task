// To parse this JSON data, do
//
//     final labelModel = labelModelFromJson(jsonString);

import 'dart:convert';

List<LabelModel> labelModelFromJson(String str) =>
    List<LabelModel>.from(json.decode(str).map((x) => LabelModel.fromJson(x)));

String labelModelToJson(List<LabelModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class LabelModel {
  LabelModel({
    this.name,
    this.catId,
    this.id,
  });

  String name;
  int catId;
  int id;

  factory LabelModel.fromJson(Map<String, dynamic> json) => LabelModel(
        name: json["name"],
        catId: json["catId"],
        id: json["id"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "catId": catId,
        "id": id,
      };
}
