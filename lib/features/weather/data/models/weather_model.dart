import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'weather_model.g.dart';

@JsonSerializable(explicitToJson: true)
class WeatherModel extends Equatable {
  final List<WeatherConditionModel> weather;
  @JsonKey(name: 'main')
  final TemperatureModel temperature;
  final int visibility;
  final WindModel wind;
  @JsonKey(fromJson: _cloudsFromJson, toJson: _cloudsToJson)
  final int clouds;
  final RainModel? rain;
  final SnowModel? snow;
  @JsonKey(name: 'dt')
  final int lastUpdate;
  @JsonKey(name: 'sys')
  final SunPositionModel sun;
  final int timezone;
  @JsonKey(name: 'name')
  final String cityName;

  WeatherModel({
    required this.weather,
    required this.temperature,
    required this.visibility,
    required this.wind,
    required this.clouds,
    this.rain,
    this.snow,
    required this.lastUpdate,
    required this.sun,
    required this.timezone,
    required this.cityName,
  });

  Map<String, dynamic> toJson() => _$WeatherModelToJson(this);

  factory WeatherModel.fromJson(Map<String, dynamic> json) =>
      _$WeatherModelFromJson(json);

  @override
  List<Object?> get props => [
        weather,
        temperature,
        visibility,
        weather,
        clouds,
        rain,
        snow,
        lastUpdate,
        sun,
        timezone,
        cityName,
      ];

  static int _cloudsFromJson(Map<String, dynamic> json) => json['all'] as int;

  static Map<String, dynamic> _cloudsToJson(int value) => {"all": value};
}

@JsonSerializable()
class WeatherConditionModel extends Equatable {
  @JsonKey(name: 'main')
  final String name;
  final String description;

  WeatherConditionModel({required this.name, required this.description});

  Map<String, dynamic> toJson() => _$WeatherConditionModelToJson(this);

  factory WeatherConditionModel.fromJson(Map<String, dynamic> json) =>
      _$WeatherConditionModelFromJson(json);

  @override
  List<Object?> get props => [name, description];
}

@JsonSerializable()
class TemperatureModel extends Equatable {
  @JsonKey(name: 'temp')
  final double current;
  @JsonKey(name: 'feels_like')
  final double feelsLike;
  @JsonKey(name: 'temp_min')
  final double min;
  @JsonKey(name: 'temp_max')
  final double max;
  final int pressure;
  final int humidity;

  TemperatureModel({
    required this.current,
    required this.feelsLike,
    required this.min,
    required this.max,
    required this.pressure,
    required this.humidity,
  });

  Map<String, dynamic> toJson() => _$TemperatureModelToJson(this);

  factory TemperatureModel.fromJson(Map<String, dynamic> json) =>
      _$TemperatureModelFromJson(json);

  @override
  List<Object?> get props => [current, feelsLike, min, max, pressure, humidity];
}

@JsonSerializable()
class WindModel extends Equatable {
  final double speed;
  @JsonKey(name: 'deg')
  final int degree;

  WindModel({required this.speed, required this.degree});

  Map<String, dynamic> toJson() => _$WindModelToJson(this);

  factory WindModel.fromJson(Map<String, dynamic> json) =>
      _$WindModelFromJson(json);

  @override
  List<Object?> get props => [speed, degree];
}

@JsonSerializable()
class RainModel extends Equatable {
  @JsonKey(name: '1h')
  final int inOneHours;
  @JsonKey(name: '3h')
  final int inThreeHours;

  RainModel({required this.inOneHours, required this.inThreeHours});

  Map<String, dynamic> toJson() => _$RainModelToJson(this);

  factory RainModel.fromJson(Map<String, dynamic> json) =>
      _$RainModelFromJson(json);

  @override
  List<Object?> get props => [inOneHours, inThreeHours];
}

@JsonSerializable()
class SnowModel extends Equatable {
  @JsonKey(name: '1h')
  final int inOneHours;
  @JsonKey(name: '3h')
  final int inThreeHours;

  SnowModel({required this.inOneHours, required this.inThreeHours});

  Map<String, dynamic> toJson() => _$SnowModelToJson(this);

  factory SnowModel.fromJson(Map<String, dynamic> json) =>
      _$SnowModelFromJson(json);

  @override
  List<Object?> get props => [inOneHours, inThreeHours];
}

@JsonSerializable()
class SunPositionModel extends Equatable {
  final String country;
  final int sunrise;
  final int sunset;

  SunPositionModel({
    required this.country,
    required this.sunrise,
    required this.sunset,
  });

  Map<String, dynamic> toJson() => _$SunPositionModelToJson(this);

  factory SunPositionModel.fromJson(Map<String, dynamic> json) =>
      _$SunPositionModelFromJson(json);

  @override
  List<Object?> get props => [country, sunrise, sunset];
}
