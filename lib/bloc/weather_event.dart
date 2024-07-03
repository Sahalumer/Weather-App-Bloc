part of 'weather_bloc.dart';

sealed class WeatherBlocEvent extends Equatable {
  const WeatherBlocEvent();

  @override
  List<Object> get props => [];
}

class Fetchweather extends WeatherBlocEvent {
  final Position position;
  const Fetchweather(this.position);

  @override
  List<Object> get props => [position];
}
