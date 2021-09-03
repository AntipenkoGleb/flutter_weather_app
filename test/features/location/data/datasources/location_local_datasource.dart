import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_weather_app/features/location/data/datasources/location_local_datasource.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'location_local_datasource.mocks.dart';

@GenerateMocks([SharedPreferences])
void main() {
  late MockSharedPreferences mockSharedPreferences;
  late LocationLocalDatasource datasource;

  setUp(() {
    mockSharedPreferences = MockSharedPreferences();
    datasource = LocationLocalDatasourceImpl(mockSharedPreferences);
  });
}
