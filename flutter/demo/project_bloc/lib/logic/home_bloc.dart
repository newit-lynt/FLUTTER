import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project_bloc/logic/home_event.dart';
// import 'package:meta/meta.dart';
import 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeInitial()) {
    on<HomeEvent>((event, emit) {});
  }
}
