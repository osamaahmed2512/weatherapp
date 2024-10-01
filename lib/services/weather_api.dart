import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:weather_app/models/weather_model.dart';

class WeatherService {
  final Dio dio = Dio();

  final String baseUrl = 'http://api.weatherapi.com/v1';
  final String apikey = '082c9f51173845aa875182442241802';
  Future<WeatherModel> getcurrentweather({required String cityname}) async {
    try {
      Response response = await dio.get(
          "$baseUrl/forecast.json?key=$apikey&q=$cityname&days=1&aqi=no&alerts=no"
          // "http://api.weatherapi.com/v1/forecast.json?key=082c9f51173845aa875182442241802&q=$cityname&days=1&aqi=no&alerts=no"
          );
      WeatherModel weathermodel = WeatherModel.fromjson(response.data);
      return weathermodel;
    } on DioException catch (e) {
      final String errmessage = e.response?.data["error"]["message"] ??
          "oops there was an error try later ";
      throw Exception(errmessage);
    } catch (e) {
      log(e.toString());
      throw Exception("oops there was an error");
    }
  }
}
