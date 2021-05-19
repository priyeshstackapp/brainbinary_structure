// To parse this JSON data, do
//
//     final cityModel = cityModelFromJson(jsonString);

import 'dart:convert';

CityModel cityModelFromJson(String str) => CityModel.fromJson(json.decode(str));

String cityModelToJson(CityModel data) => json.encode(data.toJson());

class CityModel {
  CityModel({
    this.error,
    this.msg,
    this.data,
  });

  bool error;
  String msg;
  List<CityData> data;

  factory CityModel.fromJson(Map<String, dynamic> json) => CityModel(
    error: json["error"],
    msg: json["msg"],
    data: List<CityData>.from(json["data"].map((x) => CityData.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "error": error,
    "msg": msg,
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
  };
}

class CityData {
  CityData({
    this.city,
    this.country,
  });

  String city;
  String country;

  factory CityData.fromJson(Map<String, dynamic> json) => CityData(
    city: json["city"],
    country: json["country"],
  );

  Map<String, dynamic> toJson() => {
    "city": city,
    "country": country,
  };
}