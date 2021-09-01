import '../../domain/entities/location.dart';

class LocationModel extends Location {
  LocationModel({
    required String name,
    required double lat,
    required double lon,
  }) : super(name: name, lat: lat, lon: lon);

  Map<String, dynamic> toJson() => {
        'place_name': name,
        'center': [
          lon,
          lat,
        ],
      };

  factory LocationModel.fromJson(Map<String, dynamic> json) {
    return LocationModel(
      name: json['place_name'],
      lon: (json['center'][0] as num).toDouble(),
      lat: (json['center'][1] as num).toDouble(),
    );
  }
}
