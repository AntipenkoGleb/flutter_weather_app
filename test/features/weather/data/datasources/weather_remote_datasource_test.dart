import 'dart:convert';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_weather_app/core/errors/exceptions.dart';
import 'package:flutter_weather_app/features/weather/data/datasources/weather_remote_datasource.dart';
import 'package:flutter_weather_app/features/weather/data/models/weather_model.dart';

import 'package:http/http.dart' as http;
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import '../../../../fixtures/fixture_reader.dart';
import 'weather_remote_datasource_test.mocks.dart';

@GenerateMocks([http.Client, DotEnv])
void main() {
  late WeatherRemoteDatasource datasource;
  late MockClient mockHttpClient;
  late MockDotEnv mockDotEnv;

  setUp(() async {
    mockHttpClient = MockClient();
    mockDotEnv = MockDotEnv();
    datasource =
        OpenweatherRemoteDatasource(client: mockHttpClient, env: mockDotEnv);
  });

  group('getWeather', () {
    final tApiKey = 'key';
    final tLocationLat = 1.0;
    final tLocationLon = 1.0;
    final tWeatherModel = WeatherModel.fromJson(
        json.decode(fixture('weather/weather_minsk_en_default.json')));

    void mockDotEnvForSuccess() {
      when(mockDotEnv.maybeGet(any)).thenReturn(tApiKey);
    }

    void mockHttpClientForSuccess() {
      when(mockHttpClient.get(any, headers: anyNamed('headers'))).thenAnswer(
        (_) async => http.Response(
            fixture('weather/weather_minsk_en_default.json'), 200),
      );
    }

    test('should get openweather api key from environment', () async {
      // arrange
      mockDotEnvForSuccess();
      mockHttpClientForSuccess();
      // act
      await datasource.getWeather(tLocationLat, tLocationLon);
      // assert
      verify(mockDotEnv.maybeGet(openweatherApiKeyName));
    });

    test(
        'should throw EnviromentException when can not get api key from enviroment',
        () async {
      // arrange
      when(mockDotEnv.maybeGet(any)).thenReturn(null);
      // act
      final call = datasource.getWeather;
      // assert
      expect(() => call(tLocationLat, tLocationLon),
          throwsA(isA<EnviromentException>()));
    });

    test('should preform a GET request on a URL with concrete endpoint',
        () async {
      // arrange
      mockDotEnvForSuccess();
      mockHttpClientForSuccess();
      // act
      await datasource.getWeather(tLocationLat, tLocationLon);
      // assert
      verify(mockHttpClient.get(
        Uri.https(
          openweatherApiUrl,
          openweatherApiEndpoint,
          {
            'appid': tApiKey,
            'lat': tLocationLat.toString(),
            'lon': tLocationLon.toString(),
          },
        ),
        headers: {
          'Content-Type': 'application/json',
        },
      ));
    });

    test('should return a WeatherModel when status code is success', () async {
      // arrange
      mockDotEnvForSuccess();
      mockHttpClientForSuccess();
      // act
      final result = await datasource.getWeather(tLocationLon, tLocationLat);
      // assert
      expect(result, tWeatherModel);
    });

    test('should throw a ServerException when response status code is error',
        () async {
      // arrange
      mockDotEnvForSuccess();
      when(mockHttpClient.get(any, headers: anyNamed('headers')))
          .thenAnswer((_) async => http.Response('error', 404));
      // act
      final call = datasource.getWeather;
      // assert
      expect(() => call(tLocationLat, tLocationLon),
          throwsA(isA<ServerException>()));
    });
  });
}
