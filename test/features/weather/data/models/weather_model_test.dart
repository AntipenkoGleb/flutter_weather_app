import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_weather_app/features/weather/data/models/weather_model.dart';

import '../../../../fixtures/fixture_reader.dart';

void main() {
  final tWeatherConditionModel = WeatherConditionModel(
    name: 'Clouds',
    description: 'scattered clouds',
  );
  final tTemperatureModel = TemperatureModel(
    current: 287.01,
    feelsLike: 286.7,
    min: 287.01,
    max: 287.01,
    pressure: 1011,
    humidity: 86,
  );
  final tWindModel = WindModel(
    speed: 3.07,
    degree: 227,
  );
  final tRainModel = RainModel(inOneHours: 1, inThreeHours: 3);
  final tSnowModel = SnowModel(inOneHours: 1, inThreeHours: 3);
  final tSunPositionModel = SunPositionModel(
    country: 'BY',
    sunrise: 1629255206,
    sunset: 1629308043,
  );
  final tWeatherModel = WeatherModel(
    weather: [tWeatherConditionModel],
    temperature: tTemperatureModel,
    visibility: 10000,
    wind: tWindModel,
    rain: tRainModel,
    snow: tSnowModel,
    clouds: 43,
    lastUpdate: 1629319533,
    sun: tSunPositionModel,
    timezone: 10800,
    cityName: "Minsk",
  );
  group('WeatherModel', () {
    group('WeatherConditionModel', () {
      test('fromJson', () {
        // arrange
        final jsonMap = json.decode(fixture('weather/weather_condition.json'));
        // act
        final result = WeatherConditionModel.fromJson(jsonMap);
        // assert
        expect(result, tWeatherConditionModel);
      });

      test('toJson', () {
        // arrange
        final expectedJson = {
          'main': 'Clouds',
          'description': 'scattered clouds',
        };
        // act
        final result = tWeatherConditionModel.toJson();
        // assert
        expect(result, expectedJson);
      });
    });

    group('TemperatureModel', () {
      test('fromJson', () {
        // arrange
        final jsonMap = json.decode(fixture('weather/temperature.json'));
        // act
        final result = TemperatureModel.fromJson(jsonMap);
        // assert
        expect(result, tTemperatureModel);
      });

      test('toJson', () {
        // arrange
        final expectedJson = {
          'temp': 287.01,
          'feels_like': 286.7,
          'temp_min': 287.01,
          'temp_max': 287.01,
          'pressure': 1011,
          'humidity': 86,
        };
        // act
        final result = tTemperatureModel.toJson();
        // assert
        expect(result, expectedJson);
      });
    });

    group('WindModel', () {
      test('fromJson', () {
        // arrange
        final jsonMap = json.decode(fixture('weather/wind.json'));
        // act
        final result = WindModel.fromJson(jsonMap);
        // assert
        expect(result, tWindModel);
      });

      test('toJson', () {
        // arrange
        final expectedJson = {
          'speed': 3.07,
          'deg': 227,
        };
        // act
        final result = tWindModel.toJson();
        // assert
        expect(result, expectedJson);
      });
    });

    group('RainModel', () {
      test('fromJson', () {
        // arrange
        final jsonMap = json.decode(fixture('weather/rain.json'));
        // act
        final result = RainModel.fromJson(jsonMap);
        // assert
        expect(result, tRainModel);
      });

      test('toJson', () {
        // arrange
        final expectedJson = {
          '1h': 1,
          '3h': 3,
        };
        // act
        final result = tRainModel.toJson();
        // assert
        expect(result, expectedJson);
      });
    });

    group('SnowModel', () {
      test('fromJson', () {
        // arrange
        final jsonMap = json.decode(fixture('weather/snow.json'));
        // act
        final result = SnowModel.fromJson(jsonMap);
        // assert
        expect(result, tSnowModel);
      });

      test('toJson', () {
        // arrange
        final expectedJson = {
          '1h': 1,
          '3h': 3,
        };
        // act
        final result = tSnowModel.toJson();
        // assert
        expect(result, expectedJson);
      });
    });
    group('SunPositionModel', () {
      test('fromJson', () {
        // arrange
        final jsonMap = json.decode(fixture('weather/sun_position.json'));
        // act
        final result = SunPositionModel.fromJson(jsonMap);
        // assert
        expect(result, tSunPositionModel);
      });

      test('toJson', () {
        // arrange
        final expectedJson = {
          'country': 'BY',
          'sunrise': 1629255206,
          'sunset': 1629308043,
        };
        // act
        final result = tSunPositionModel.toJson();
        // assert
        expect(result, expectedJson);
      });
    });

    test('fromJson', () {
      // arrange
      final jsonMap =
          json.decode(fixture('weather/weather_minsk_en_default.json'));
      // act
      final result = WeatherModel.fromJson(jsonMap);
      // assert
      expect(result, tWeatherModel);
    });

    test('toJson', () {
      // arrange
      final expectedJson = {
        'weather': [tWeatherConditionModel.toJson()],
        'main': tTemperatureModel.toJson(),
        'visibility': 10000,
        'wind': tWindModel.toJson(),
        'rain': tRainModel.toJson(),
        'snow': tSnowModel.toJson(),
        'clouds': {'all': 43},
        'dt': 1629319533,
        'sys': tSunPositionModel.toJson(),
        'timezone': 10800,
        'name': "Minsk",
      };
      // act
      final result = tWeatherModel.toJson();
      // assert
      expect(result, expectedJson);
    });
  });
}
