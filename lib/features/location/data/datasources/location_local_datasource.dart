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
  LocationModel load(String name) {
    // TODO: implement load
    throw UnimplementedError();
  }

  @override
  List<LocationModel> loadAll() {
    // TODO: implement loadAll
    throw UnimplementedError();
  }

  @override
  Future<void> save(LocationModel location) async {
    // TODO: implement save
    throw UnimplementedError();
  }
}
