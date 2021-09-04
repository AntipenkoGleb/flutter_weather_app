import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_weather_app/core/errors/exceptions.dart';
import 'package:flutter_weather_app/features/location/data/datasources/location_local_datasource.dart';
import 'package:flutter_weather_app/features/location/data/models/location_model.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../fixtures/fixture_reader.dart';
import 'location_local_datasource_test.mocks.dart';

@GenerateMocks([SharedPreferences])
void main() {
  late MockSharedPreferences mockSharedPreferences;
  late LocationLocalDatasource datasource;

  setUp(() {
    mockSharedPreferences = MockSharedPreferences();
    datasource = LocationLocalDatasourceImpl(mockSharedPreferences);
  });

  group('save', () {
    final tLocationsModel =
        LocationModel.fromJson(json.decode(fixture('location/minsk.json')));
    test(
      'should call SharedPreferences to cache the data',
      () async {
        // arrange
        when(mockSharedPreferences.setString(any, any))
            .thenAnswer((_) async => true);
        // act
        datasource.save(tLocationsModel);
        // assert
        final expectedJson = json.encode(tLocationsModel.toJson());
        verify(
          mockSharedPreferences.setString(
              'location: ${tLocationsModel.name}', expectedJson),
        );
      },
    );
  });
  group('load', () {
    final LocationModel tLocationModel =
        LocationModel.fromJson(json.decode(fixture('location/minsk.json')));

    test(
      'should return LocationModel from SharedPreferences when there is one in the cache',
      () async {
        // arrange
        when(mockSharedPreferences.getString(any))
            .thenReturn(fixture('location/minsk.json'));
        // act
        final result = datasource.load(tLocationModel.name);
        // assert
        verify(mockSharedPreferences
            .getString('location: ${tLocationModel.name}'));
        expect(result, tLocationModel);
      },
    );

    test(
      'should throw a CacheException when there is not a cached value',
      () {
        // arrange
        when(mockSharedPreferences.getString(any)).thenReturn(null);
        // act
        final call = datasource.load;
        // assert
        expect(
          () => call(tLocationModel.name),
          throwsA(isA<CacheException>()),
        );
      },
    );
  });
}
