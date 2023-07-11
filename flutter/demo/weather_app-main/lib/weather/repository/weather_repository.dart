import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:weather_app/weather/models/cityname_result.dart';
// import 'package:weather_app/weather/models/current_weather.dart';

/// {@template open_meteo_api_client}
/// Dart API Client which wraps the [Open Meteo API](https://open-meteo.com).
/// {@endtemplate}
class WeatherRepo {
  Future<SearchCityNameResult> getLatLng({
    required String cityName,
    required int count,
  }) async {
    //GET, POST, PUT, PATCH, DELETE,....
    final url = Uri.parse(
        'https://geocoding-api.open-meteo.com/v1/search?name=$cityName&count=$count');
    final request;
    (request = await http.get(url));
    print(request);
    if (request.statusCode == 200) {
      return SearchCityNameResult.fromJson(
          jsonDecode(request.body)['results'][0]);
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      print(request.statusCode.toString());
      throw Exception('Failed to load user');
    }
    // var response = jsonDecode(request.body) as Map<String, dynamic>;
    // return SearchCityNameResult.fromJson(response['results'][0]);
    // //return SearchCityNameResult.fromJson(request.);
  }

  Future<bool> getWeather({
    double? latitude,
    double? longitude,
    bool currentWeather = true,
  }) async {
    final url = Uri.parse(
        'https://api.open-meteo.com/v1/forecast?latitude=$latitude&longitude=$longitude&current_weather=$currentWeather');
    final response = await http.get(url);
    print(response);
    // final result=JsonDecoder(response.body)

    return true;
  }
}
