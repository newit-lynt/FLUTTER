part of 'weather_bloc.dart';

class WeatherState extends Equatable {
  const WeatherState({
    this.searchCityNameResult,
    this.loadStatus = LoadStatus.pure,
    this.errorMessage = '',
  });

  final SearchCityNameResult? searchCityNameResult;
  final LoadStatus loadStatus;
  final String errorMessage;
  WeatherState copyWith(
      {SearchCityNameResult? searchCityNameResult,
      LoadStatus? loadStatus,
      String? errorMessage = ''}) {
    return WeatherState(
      searchCityNameResult: searchCityNameResult ?? this.searchCityNameResult,
      loadStatus: loadStatus ?? this.loadStatus,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }

  @override
  List<Object?> get props => [searchCityNameResult, loadStatus, errorMessage];
}
