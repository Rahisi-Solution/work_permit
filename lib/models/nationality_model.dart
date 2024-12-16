import 'dart:convert';

class NationalityModel {
  String? id;
  String? nationality;
  String? country;

  NationalityModel({
    this.id,
    this.nationality,
    this.country,
  });

  factory NationalityModel.fromRawJson(String string) => NationalityModel.fromJson(json.decode(string));

  String toRawJson() => json.encode(toJson());

  factory NationalityModel.fromJson(Map<String, dynamic> json) => NationalityModel(
        id: json['id'],
        nationality: json['nationality'],
        country: json['country'],
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'nationality': nationality,
        'country': country,
      };
}
