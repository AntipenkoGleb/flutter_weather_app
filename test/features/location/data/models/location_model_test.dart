import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_weather_app/features/location/data/models/location_model.dart';
import 'package:flutter_weather_app/features/location/domain/entities/location.dart';

import '../../../../fixtures/fixture_reader.dart';

void main() {
  final tLocation =
      LocationModel(name: 'Minsk, Belarus', lat: 53.90225, lon: 27.56184);
  group('fromJson', () {
    test('should return a valid model', () {
      // arrange
      final jsonMap = json.decode(fixture('location/minsk.json'));
      // act
      final result = LocationModel.fromJson(jsonMap);
      // assert
      expect(result, tLocation);
    });
  });
  group('toJson', () {
    test('should return a JSON map containing the proper data', () {
      // arrange
      final expectedJson = {
        'place_name': tLocation.name,
        'center': [
          tLocation.lon,
          tLocation.lat,
        ],
      };
      // act
      final result = tLocation.toJson();
      // assert
      expect(result, expectedJson);
    });
  });
}
