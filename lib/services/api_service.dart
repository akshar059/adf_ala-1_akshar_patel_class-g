import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/country_model.dart';

class ApiService {

  static const String url =
      "https://restcountries.com/v3.1/all?fields=name,capital,region,population,flags";

  static Future<List<Country>> fetchCountries() async {

    try {
      final response = await http.get(Uri.parse(url));

      if (response.statusCode == 200) {
        List jsonData = json.decode(response.body);

        return jsonData
            .map((e) => Country.fromJson(e))
            .toList();
      } else {
        throw Exception(
            "Server error: ${response.statusCode}");
      }
    } catch (e) {
      throw Exception("Network error: $e");
    }
  }
}
