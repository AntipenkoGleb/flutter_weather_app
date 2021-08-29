import 'package:flutter_weather_app/features/weather/data/models/weather_model.dart';

abstract class WeatherRemoteDatasource {
  Future<WeatherModel> getWeather(double lat, double lon);
}

class OpenweatherRemoteDatasource extends WeatherRemoteDatasource {
  @override
  Future<WeatherModel> getWeather(double lat, double lon) {
    throw UnimplementedError();
  }
}
