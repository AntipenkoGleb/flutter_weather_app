import 'dart:convert';

import 'package:flutter_weather_app/core/errors/exceptions.dart';
import 'package:flutter_weather_app/features/location/data/models/location_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class LocationLocalDatasource {
  Future<void> save(LocationModel location);
  LocationModel load(String name);
}

class LocationLocalDatasourceImpl extends LocationLocalDatasource {
  final SharedPreferences preferences;

  LocationLocalDatasourceImpl(this.preferences);

  @override
  Future<void> save(LocationModel location) async {
    preferences.setString(
        'location: ${location.name}', json.encode(location.toJson()));
  }

  @override
  LocationModel load(String name) {
    final value = preferences.getString('location: $name');
    if (value != null) {
      return LocationModel.fromJson(json.decode(value));
    } else {
      throw CacheException();
    }
  }
}
