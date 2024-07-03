import 'dart:convert';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart' as http;

part 'weather_event.dart';
part 'weather_state.dart';

class WeatherBlocBloc extends Bloc<WeatherBlocEvent, WeatherBlocState> {
  WeatherBlocBloc() : super(WeatherBlocInitial()) {
    on<Fetchweather>((event, emit) async {
      emit(WeatherBlocloading());
      try {
        String apikey = 'e0acd9d06351e893ae35edc64174f869';
        String url =
            'https://api.openweathermap.org/data/2.5/weather?lat=${event.position.latitude}&lon=${event.position.longitude}&appid=$apikey&units=metric';

        final response = await http.get(Uri.parse(url));

        if (response.statusCode == 200) {
          final weatherData = jsonDecode(response.body);
          emit(WeatherBlocsuccess(weatherData));
        } else {
          emit(WeatherBlocfailure());
        }
      } catch (e) {
        emit(WeatherBlocfailure());
      }
    });
  }
}
