import 'dart:convert';

class GenderModel {
  String? id;
  String? name;

  GenderModel({
    this.id,
    this.name,
  });

  factory GenderModel.fromRawJson(String string) => GenderModel.fromJson(json.decode(string));

  String toRawJson() => json.encode(toJson());

  factory GenderModel.fromJson(Map<String, dynamic> json) => GenderModel(
        id: json['id'],
        name: json['name'],
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
      };
}
