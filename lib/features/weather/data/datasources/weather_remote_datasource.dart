import 'dart:convert';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_weather_app/core/errors/exceptions.dart';
import 'package:flutter_weather_app/features/weather/data/models/weather_model.dart';
import 'package:http/http.dart' as http;

abstract class WeatherRemoteDatasource {
  Future<WeatherModel> getWeather(double lat, double lon);
}

const String openweatherApiKeyName = 'OPENWEATHER_API_KEY';

const String openweatherApiUrl = 'api.openweathermap.org';

const String openweatherApiEndpoint = 'data/2.5/weather';

class OpenweatherRemoteDatasource extends WeatherRemoteDatasource {
  final http.Client client;
  final DotEnv env;

  OpenweatherRemoteDatasource({required this.client, required this.env});

  @override
  Future<WeatherModel> getWeather(double lat, double lon) async {
    final apiKey = env.maybeGet(openweatherApiKeyName);
    if (apiKey == null) throw EnviromentException();

    final uri = Uri.https(openweatherApiUrl, openweatherApiEndpoint, {
      'appid': apiKey,
      'lat': lat.toString(),
      'lon': lon.toString(),
    });

    final response =
        await client.get(uri, headers: {'Content-Type': 'application/json'});

    if (response.statusCode == 200) {
      return WeatherModel.fromJson(json.decode(response.body));
    } else {
      throw ServerException();
    }
  }
}
