part of 'home_bloc.dart';

abstract class HomeEvent {
  const HomeEvent();
}

class TriggerHomeEvent extends HomeEvent {
  final int index;

  const TriggerHomeEvent({required this.index}) : super();
}
