import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_weather_app/core/errors/exceptions.dart';
import 'package:flutter_weather_app/features/weather/data/datasources/weather_localal_datasource.dart';
import 'package:flutter_weather_app/features/weather/data/models/weather_model.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../fixtures/fixture_reader.dart';
import 'weather_local_datasource_test.mocks.dart';

@GenerateMocks([SharedPreferences])
void main() {
  late MockSharedPreferences mockSharedPreferences;
  late WeatherLocalDatasource datasource;

  setUp(() {
    mockSharedPreferences = MockSharedPreferences();
    datasource = WeatherLocalDatasourceImpl(mockSharedPreferences);
  });

  group('save', () {
    final WeatherModel tWeatherModel = WeatherModel.fromJson(
        json.decode(fixture('weather/weather_minsk_en_default.json')));
    test(
      'should call SharedPreferences to cache the data',
      () async {
        // arrange
        when(mockSharedPreferences.setString(any, any))
            .thenAnswer((_) async => true);
        // act
        datasource.save(tWeatherModel);
        // assert
        final expectedJson = json.encode(tWeatherModel.toJson());
        verify(
          mockSharedPreferences.setString(tWeatherModel.cityName, expectedJson),
        );
      },
    );
  });

  group('load', () {
    final WeatherModel tWeatherModel = WeatherModel.fromJson(
        json.decode(fixture('weather/weather_minsk_en_default.json')));

    test(
      'should return WeatherModel from SharedPreferences when there is one in the cache',
      () async {
        // arrange
        when(mockSharedPreferences.getString(any))
            .thenReturn(fixture('weather/weather_minsk_en_default.json'));
        // act
        final result = datasource.load(tWeatherModel.cityName);
        // assert
        verify(mockSharedPreferences.getString(tWeatherModel.cityName));
        expect(result, tWeatherModel);
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
          () => call(tWeatherModel.cityName),
          throwsA(isA<CacheException>()),
        );
      },
    );
  });
}
