import 'dart:convert';

import 'package:flutter_weather_app/core/errors/exceptions.dart';
import 'package:flutter_weather_app/features/weather/data/models/weather_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class WeatherLocalDatasource {
  Future<void> save(WeatherModel weather);

  WeatherModel load(String name);
}

class WeatherLocalDatasourceImpl extends WeatherLocalDatasource {
  final SharedPreferences preferences;

  WeatherLocalDatasourceImpl(this.preferences);

  @override
  Future<void> save(WeatherModel weather) async {
    preferences.setString(weather.cityName, json.encode(weather.toJson()));
  }

  @override
  WeatherModel load(String name) {
    final value = preferences.getString(name);
    if (value != null) {
      return WeatherModel.fromJson(json.decode(value));
    } else {
      throw CacheException();
    }
  }
}
