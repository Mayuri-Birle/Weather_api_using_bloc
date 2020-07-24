import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:weather_api_using_bloc/weather_model.dart';

class WeatherRepo {
  Future<WeatherModel> getWeather(String city) async {
    final result = await http.Client().get(
        "https://api.openweathermap.org/data/2.5/weather?q=$city&appid=29d331daa1442612cbb01a90e1ef0325");

    if (result.statusCode != 200) throw Exception();
    return parsedJson(result.body);
  }

  WeatherModel parsedJson(final response) {
    final jsonDecoded = json.decode(response);

    final jsonWeather = jsonDecode("main");

    return WeatherModel.fromJson(jsonWeather);
  }
}
