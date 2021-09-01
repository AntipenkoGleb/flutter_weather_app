import 'package:equatable/equatable.dart';

class Location extends Equatable {
  final String name;
  final double lat;
  final double lon;

  Location({required this.name, required this.lat, required this.lon});

  @override
  List<Object?> get props => [name, lat, lon];
}
