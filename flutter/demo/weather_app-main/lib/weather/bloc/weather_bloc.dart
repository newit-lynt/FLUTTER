import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:weather_app/weather/repository/weather_repository.dart';

import '../models/cityname_result.dart';
import '../models/loadstatus.dart';

part 'weather_event.dart';
part 'weather_state.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  WeatherRepo weatherRepo;
  WeatherBloc({required this.weatherRepo}) : super(const WeatherState()) {
    on<ClickSun>(_onClickSun);
  }

  // FutureOr<void> clickSun(ClickSun event, Emitter<WeatherState> emit) async {
  //   // emit(state.copyWith(loadStatus: LoadStatus.loading));
  //   try {
  //     print(1);
  //     final location =
  //         await weatherRepo.getLatLng(cityName: 'chicago', count: 1);
  //     print(2);
  //     emit(state.copyWith(loadStatus: LoadStatus.success));
  //     return emit(state.copyWith(searchCityNameResult: location));
  //   } catch (e) {
  //     return emit(
  //       state.copyWith(
  //           errorMessage: e.toString(), loadStatus: LoadStatus.failed),
  //     );
  //   }
  // }
  FutureOr<void> _onClickSun(ClickSun event, Emitter<WeatherState> emit) async {
    emit(state.copyWith(loadStatus: LoadStatus.loading));
    try {
      final model = await weatherRepo.getLatLng(
        cityName: 'Chicago',
        count: 1,
      );
      print(model);
      return emit(state.copyWith(
        searchCityNameResult: model,
        loadStatus: LoadStatus.success,
      ));
    } catch (e) {
      return emit(state.copyWith(
        loadStatus: LoadStatus.failed,
        errorMessage: e.toString(),
      ));
    }
  }
}
