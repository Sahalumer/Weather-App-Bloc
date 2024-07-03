part of 'weather_bloc.dart';

sealed class WeatherBlocState extends Equatable {
  const WeatherBlocState();

  @override
  List<Object> get props => [];
}

final class WeatherBlocInitial extends WeatherBlocState {}

final class WeatherBlocloading extends WeatherBlocState {}

final class WeatherBlocfailure extends WeatherBlocState {}

final class WeatherBlocsuccess extends WeatherBlocState {
  final Map<String, dynamic> weatherData;
  const WeatherBlocsuccess(this.weatherData);

  @override
  List<Object> get props => [weatherData];
}
