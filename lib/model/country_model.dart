// To parse this JSON data, do
//
//     final countryModel = countryModelFromJson(jsonString);

import 'dart:convert';

CountryModel countryModelFromJson(String str) => CountryModel.fromJson(json.decode(str));

String countryModelToJson(CountryModel data) => json.encode(data.toJson());

class CountryModel {
  CountryModel({
    this.error,
    this.msg,
    this.data,
  });

  bool error;
  String msg;
  List<CountryData> data;

  factory CountryModel.fromJson(Map<String, dynamic> json) => CountryModel(
    error: json["error"],
    msg: json["msg"],
    data: List<CountryData>.from(json["data"].map((x) => CountryData.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "error": error,
    "msg": msg,
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
  };
}

class CountryData {
  CountryData({
    this.country,
    this.cities,
  });

  String country;
  List<String> cities;

  factory CountryData.fromJson(Map<String, dynamic> json) => CountryData(
    country: json["country"],
    cities: List<String>.from(json["cities"].map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "country": country,
    "cities": List<dynamic>.from(cities.map((x) => x)),
  };
}
