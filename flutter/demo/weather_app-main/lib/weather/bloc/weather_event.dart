part of 'weather_bloc.dart';

abstract class WeatherEvent extends Equatable {
  WeatherEvent();

  @override
  List<Object> get props => [];
}

class ClickSun extends WeatherEvent {
  final String cityName;

  ClickSun(this.cityName);
}
