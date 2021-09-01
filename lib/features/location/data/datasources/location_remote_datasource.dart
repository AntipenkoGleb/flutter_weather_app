import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;

import '../models/location_model.dart';

abstract class LocationRemoteDatasource {
  Future<LocationModel> getLocationByCoords(double lat, double lon);

  Future<List<LocationModel>> getLocationByName(String name);
}

const String mapboxApiUrl = 'https://api.mapbox.com/';
const String mapboxApiEnpoint = 'geocoding/v5/mapbox.places';
const String mapboxApiKeyName = 'MAPBOX_API_KEY';

class MapboxLocationRemoteDatasource extends LocationRemoteDatasource {
  final http.Client client;
  final DotEnv env;

  MapboxLocationRemoteDatasource({required this.client, required this.env});

  @override
  Future<LocationModel> getLocationByCoords(double lat, double lon) {
    // TODO: implement getLocationByCoords
    throw UnimplementedError();
  }

  @override
  Future<List<LocationModel>> getLocationByName(String name) {
    // TODO: implement getLocationByName
    throw UnimplementedError();
  }
}
