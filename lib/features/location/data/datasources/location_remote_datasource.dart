import 'dart:convert';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_weather_app/core/errors/exceptions.dart';
import 'package:http/http.dart' as http;

import '../models/location_model.dart';

abstract class LocationRemoteDatasource {
  Future<LocationModel> getLocationByCoords(double lat, double lon);

  Future<List<LocationModel>> getLocationByName(String name);
}

const String locationApiUrl = 'api.mapbox.com';
const String locationApiEndpoint = 'geocoding/v5/mapbox.places';
const String locationApiKeyName = 'MAPBOX_API_KEY';

class MapboxLocationRemoteDatasource extends LocationRemoteDatasource {
  final http.Client client;
  final DotEnv env;

  MapboxLocationRemoteDatasource({required this.client, required this.env});

  @override
  Future<LocationModel> getLocationByCoords(double lat, double lon) async {
    final apiKey = env.maybeGet(locationApiKeyName);
    if (apiKey == null) throw EnviromentException();

    final response = await client.get(
      Uri.https(
        locationApiUrl,
        '$locationApiEndpoint/$lon,$lat.json',
        {
          'types': 'region',
          'access_token': apiKey,
        },
      ),
      headers: {'Content-Type': 'application/json'},
    );

    if (response.statusCode == 200) {
      return (json.decode(response.body)['features'] as List<dynamic>)
          .map((l) => LocationModel.fromJson(l as Map<String, dynamic>))
          .toList()
          .first;
    } else {
      throw ServerException();
    }
  }

  @override
  Future<List<LocationModel>> getLocationByName(String name) {
    // TODO: implement getLocationByName
    throw UnimplementedError();
  }
}
