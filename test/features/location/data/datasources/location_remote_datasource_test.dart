import 'dart:convert';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_weather_app/core/errors/exceptions.dart';
import 'package:flutter_weather_app/features/location/data/datasources/location_remote_datasource.dart';
import 'package:flutter_weather_app/features/location/data/models/location_model.dart';
import 'package:mockito/annotations.dart';

import 'package:http/http.dart' as http;
import 'package:mockito/mockito.dart';

import '../../../../fixtures/fixture_reader.dart';
import 'location_remote_datasource_test.mocks.dart';

@GenerateMocks([http.Client, DotEnv])
void main() {
  late MockClient mockHttpClient;
  late MockDotEnv mockDotEnv;
  late LocationRemoteDatasource datasource;

  setUp(() {
    mockHttpClient = MockClient();
    mockDotEnv = MockDotEnv();
    datasource =
        MapboxLocationRemoteDatasource(client: mockHttpClient, env: mockDotEnv);
  });

  group('getLocationByCoords', () {
    final String tApiKEy = 'api_key';
    final double tLocationLat = 1;
    final double tLocationLon = 2;
    final List<LocationModel> tLocationModels = (json.decode(
      fixture('location/query_minsk.json'),
    )['features'] as List<dynamic>)
        .map((l) => LocationModel.fromJson(l as Map<String, dynamic>))
        .toList();

    void mockDotEnvForSuccess() {
      when(mockDotEnv.maybeGet(any)).thenReturn(tApiKEy);
    }

    void mockHttpClientForSuccess() {
      when(mockHttpClient.get(any, headers: anyNamed('headers'))).thenAnswer(
        (_) async => http.Response(
          fixture('location/query_minsk.json'),
          200,
        ),
      );
    }

    test(
      'should get an api key from environment',
      () async {
        // arrange
        mockDotEnvForSuccess();
        mockHttpClientForSuccess();
        // act
        await datasource.getLocationByCoords(tLocationLat, tLocationLon);
        // assert
        verify(mockDotEnv.maybeGet(locationApiKeyName));
      },
    );

    test(
      'should throw Environment exception when can not get api key from environment',
      () async {
        // arrange
        when(mockDotEnv.maybeGet(any)).thenReturn(null);
        mockHttpClientForSuccess();
        // act
        final call = datasource.getLocationByCoords;
        // assert
        expect(() => call(tLocationLat, tLocationLon),
            throwsA(isA<EnviromentException>()));
      },
    );

    test(
      'should preform a GET request on a URL with concrete endpoint',
      () async {
        // arrange
        mockDotEnvForSuccess();
        mockHttpClientForSuccess();
        // act
        await datasource.getLocationByCoords(tLocationLat, tLocationLon);
        // assert
        verify(mockHttpClient.get(
            Uri.https(
              locationApiUrl,
              '$locationApiEndpoint/$tLocationLon,$tLocationLat.json',
              {
                'types': 'region',
                'access_token': tApiKEy,
              },
            ),
            headers: {'Content-Type': 'application/json'}));
      },
    );

    test(
      'should return valid LocationModel when response status code is success',
      () async {
        // arrange
        mockDotEnvForSuccess();
        mockHttpClientForSuccess();
        // act
        final result =
            await datasource.getLocationByCoords(tLocationLat, tLocationLon);
        // assert
        expect(result, tLocationModels);
      },
    );

    test(
      'should return empty list of LocationModel when locations not founded',
      () async {
        // arrange
        mockDotEnvForSuccess();
        when(mockHttpClient.get(any, headers: anyNamed('headers'))).thenAnswer(
          (_) async => http.Response(
            fixture('location/location_not_founded.json'),
            200,
          ),
        );
        // act
        final result =
            await datasource.getLocationByCoords(tLocationLat, tLocationLon);
        // assert
        expect(result, List<LocationModel>.empty());
      },
    );

    test(
      'should throw ServerException when response status code is failed',
      () async {
        // arrange
        mockDotEnvForSuccess();
        when(mockHttpClient.get(any, headers: anyNamed('headers')))
            .thenAnswer((_) async => http.Response('error', 400));
        // act
        final call = datasource.getLocationByCoords;
        // assert
        expect(() => call(tLocationLat, tLocationLon),
            throwsA(isA<ServerException>()));
      },
    );
  });

  group('getLocationByName', () {
    final String tApiKEy = 'api_key';
    final String tLocationName = 'minsk';

    final List<LocationModel> tLocationModels = (json.decode(
      fixture('location/query_minsk.json'),
    )['features'] as List<dynamic>)
        .map((l) => LocationModel.fromJson(l as Map<String, dynamic>))
        .toList();

    void mockDotEnvForSuccess() {
      when(mockDotEnv.maybeGet(any)).thenReturn(tApiKEy);
    }

    void mockHttpClientForSuccess() {
      when(mockHttpClient.get(any, headers: anyNamed('headers'))).thenAnswer(
        (_) async => http.Response(
          fixture('location/query_minsk.json'),
          200,
        ),
      );
    }

    test(
      'should get an api key from environment',
      () async {
        // arrange
        mockDotEnvForSuccess();
        mockHttpClientForSuccess();
        // act
        await datasource.getLocationByName(tLocationName);
        // assert
        verify(mockDotEnv.maybeGet(locationApiKeyName));
      },
    );

    test(
      'should throw Environment exception when can not get api key from environment',
      () async {
        // arrange
        when(mockDotEnv.maybeGet(any)).thenReturn(null);
        mockHttpClientForSuccess();
        // act
        final call = datasource.getLocationByName;
        // assert
        expect(() => call(tLocationName), throwsA(isA<EnviromentException>()));
      },
    );

    test(
      'should preform a GET request on a URL with concrete endpoint',
      () async {
        // arrange
        mockDotEnvForSuccess();
        mockHttpClientForSuccess();
        // act
        await datasource.getLocationByName(tLocationName);
        // assert
        verify(mockHttpClient.get(
            Uri.https(
              locationApiUrl,
              '$locationApiEndpoint/$tLocationName.json',
              {
                'types': 'region',
                'access_token': tApiKEy,
              },
            ),
            headers: {'Content-Type': 'application/json'}));
      },
    );

    test(
      'should return valid LocationModel when response status code is success',
      () async {
        // arrange
        mockDotEnvForSuccess();
        mockHttpClientForSuccess();
        // act
        final result = await datasource.getLocationByName(tLocationName);
        // assert
        expect(result, tLocationModels);
      },
    );

    test(
      'should return empty list of LocationModel when locations not founded',
      () async {
        // arrange
        mockDotEnvForSuccess();
        when(mockHttpClient.get(any, headers: anyNamed('headers'))).thenAnswer(
          (_) async => http.Response(
            fixture('location/location_not_founded.json'),
            200,
          ),
        );
        // act
        final result = await datasource.getLocationByName(tLocationName);
        // assert
        expect(result, List<LocationModel>.empty());
      },
    );

    test(
      'should throw ServerException when response status code is failed',
      () async {
        // arrange
        mockDotEnvForSuccess();
        when(mockHttpClient.get(any, headers: anyNamed('headers')))
            .thenAnswer((_) async => http.Response('error', 400));
        // act
        final call = datasource.getLocationByName;
        // assert
        expect(() => call(tLocationName), throwsA(isA<ServerException>()));
      },
    );
  });
}
