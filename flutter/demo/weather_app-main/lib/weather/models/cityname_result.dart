import 'package:equatable/equatable.dart';

class SearchCityNameResult extends Equatable {
  final String name;
  final double latitude;
  final double longitude;
  final String country;

  const SearchCityNameResult({
    required this.name,
    required this.latitude,
    required this.longitude,
    required this.country,
  });

  factory SearchCityNameResult.fromJson(Map<String, dynamic> json) {
    return SearchCityNameResult(
      name: json['name'],
      latitude: json['latitude'],
      longitude: json['longitude'],
      country: json['country'],
    );
  }
  @override
  List<Object?> get props => [];
}
