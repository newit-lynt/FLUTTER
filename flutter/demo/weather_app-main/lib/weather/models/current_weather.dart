import 'package:equatable/equatable.dart';
// import 'package:json_annotation/json_annotation.dart';

class CurrentWeather extends Equatable {
  final num temparature;
  final num windSpeed;
  final DateTime time;
  final int weatherCode;

  const CurrentWeather({
    required this.temparature,
    required this.windSpeed,
    required this.time,
    required this.weatherCode,
  });

  factory CurrentWeather.fromJson(Map<String, dynamic> json) {
    return CurrentWeather(
      temparature: json['temparature'],
      windSpeed: json['windspeed'],
      weatherCode: json['weathercode'],
      time: DateTime.parse(json['time']),
    );
  }

  @override
  List<Object?> get props => [];
}
