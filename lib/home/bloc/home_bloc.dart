import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(const HomeState(index: 0)) {
    on<HomeEvent>((event, emit) {});
    on<TriggerHomeEvent>(_triggerSettings);
  }
  _triggerSettings(event, emit) {
    emit(HomeState(index: event.index));
    if (kDebugMode) {
      print('My tapped index: ${event.index}');
    }
  }
}
