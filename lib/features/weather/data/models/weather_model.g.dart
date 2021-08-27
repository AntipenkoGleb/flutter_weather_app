// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'weather_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WeatherModel _$WeatherModelFromJson(Map<String, dynamic> json) {
  return WeatherModel(
    weather: (json['weather'] as List<dynamic>)
        .map((e) => WeatherConditionModel.fromJson(e as Map<String, dynamic>))
        .toList(),
    temperature:
        TemperatureModel.fromJson(json['main'] as Map<String, dynamic>),
    visibility: json['visibility'] as int,
    wind: WindModel.fromJson(json['wind'] as Map<String, dynamic>),
    clouds:
        WeatherModel._cloudsFromJson(json['clouds'] as Map<String, dynamic>),
    rain: json['rain'] == null
        ? null
        : RainModel.fromJson(json['rain'] as Map<String, dynamic>),
    snow: json['snow'] == null
        ? null
        : SnowModel.fromJson(json['snow'] as Map<String, dynamic>),
    lastUpdate: json['dt'] as int,
    sun: SunPositionModel.fromJson(json['sys'] as Map<String, dynamic>),
    timezone: json['timezone'] as int,
    cityName: json['name'] as String,
  );
}

Map<String, dynamic> _$WeatherModelToJson(WeatherModel instance) =>
    <String, dynamic>{
      'weather': instance.weather.map((e) => e.toJson()).toList(),
      'main': instance.temperature.toJson(),
      'visibility': instance.visibility,
      'wind': instance.wind.toJson(),
      'clouds': WeatherModel._cloudsToJson(instance.clouds),
      'rain': instance.rain?.toJson(),
      'snow': instance.snow?.toJson(),
      'dt': instance.lastUpdate,
      'sys': instance.sun.toJson(),
      'timezone': instance.timezone,
      'name': instance.cityName,
    };

WeatherConditionModel _$WeatherConditionModelFromJson(
    Map<String, dynamic> json) {
  return WeatherConditionModel(
    name: json['main'] as String,
    description: json['description'] as String,
  );
}

Map<String, dynamic> _$WeatherConditionModelToJson(
        WeatherConditionModel instance) =>
    <String, dynamic>{
      'main': instance.name,
      'description': instance.description,
    };

TemperatureModel _$TemperatureModelFromJson(Map<String, dynamic> json) {
  return TemperatureModel(
    current: (json['temp'] as num).toDouble(),
    feelsLike: (json['feels_like'] as num).toDouble(),
    min: (json['temp_min'] as num).toDouble(),
    max: (json['temp_max'] as num).toDouble(),
    pressure: json['pressure'] as int,
    humidity: json['humidity'] as int,
  );
}

Map<String, dynamic> _$TemperatureModelToJson(TemperatureModel instance) =>
    <String, dynamic>{
      'temp': instance.current,
      'feels_like': instance.feelsLike,
      'temp_min': instance.min,
      'temp_max': instance.max,
      'pressure': instance.pressure,
      'humidity': instance.humidity,
    };

WindModel _$WindModelFromJson(Map<String, dynamic> json) {
  return WindModel(
    speed: (json['speed'] as num).toDouble(),
    degree: json['deg'] as int,
  );
}

Map<String, dynamic> _$WindModelToJson(WindModel instance) => <String, dynamic>{
      'speed': instance.speed,
      'deg': instance.degree,
    };

RainModel _$RainModelFromJson(Map<String, dynamic> json) {
  return RainModel(
    inOneHours: json['1h'] as int,
    inThreeHours: json['3h'] as int,
  );
}

Map<String, dynamic> _$RainModelToJson(RainModel instance) => <String, dynamic>{
      '1h': instance.inOneHours,
      '3h': instance.inThreeHours,
    };

SnowModel _$SnowModelFromJson(Map<String, dynamic> json) {
  return SnowModel(
    inOneHours: json['1h'] as int,
    inThreeHours: json['3h'] as int,
  );
}

Map<String, dynamic> _$SnowModelToJson(SnowModel instance) => <String, dynamic>{
      '1h': instance.inOneHours,
      '3h': instance.inThreeHours,
    };

SunPositionModel _$SunPositionModelFromJson(Map<String, dynamic> json) {
  return SunPositionModel(
    country: json['country'] as String,
    sunrise: json['sunrise'] as int,
    sunset: json['sunset'] as int,
  );
}

Map<String, dynamic> _$SunPositionModelToJson(SunPositionModel instance) =>
    <String, dynamic>{
      'country': instance.country,
      'sunrise': instance.sunrise,
      'sunset': instance.sunset,
    };
