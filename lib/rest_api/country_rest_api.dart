import 'dart:convert';

import 'package:brainbinary_structure/utils/debug.dart';
import 'package:brainbinary_structure/utils/rest.dart';
import 'package:http/http.dart';
import 'package:http/http.dart' as http;
import 'package:brainbinary_structure/model/city_model.dart';
import 'package:brainbinary_structure/model/country_model.dart';

class RestApi {
  static Future<CountryModel> getCountry() async {
    try {
      String url = RestRes.baseUrl + RestRes.countries;
      Debug.print(url);

      Response response = await http.get(Uri.parse(url));
      Debug.print(response.statusCode);
      Debug.print(response.body);
      if (response.statusCode == 200) {
        if (jsonDecode(response.body)['error'] == false) {
          return countryModelFromJson(response.body);
        } else {
          return null;
        }
      } else {
        return null;
      }
    } catch (e) {
      throw Exception(["$e"]);
    }
  }

  static Future<CityModel> getCity(String country) async {
    try {
      String url = RestRes.baseUrl + RestRes.city;
      Debug.print(url);

      Map<String, dynamic> bodyData = {"country": country};

      Debug.print(bodyData);

      Response response = await http.post(Uri.parse(url), body: bodyData);
      Debug.print(response.statusCode);
      Debug.print(response.body);
      if (response.statusCode == 200) {
        if (jsonDecode(response.body)['error'] == false) {
          return cityModelFromJson(response.body);
        } else {
          return null;
        }
      } else {
        return null;
      }
    } catch (e) {
      print(e);
      return null;
    }
  }
}
