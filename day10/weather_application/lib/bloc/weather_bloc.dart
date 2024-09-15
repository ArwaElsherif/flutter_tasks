import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:weather/weather.dart';

part 'weather_event.dart';
part 'weather_state.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  final WeatherFactory wf;

  WeatherBloc() 
    : wf = WeatherFactory("645e8e498d88e41e6f772fd36d979e41", language: Language.ENGLISH),
      super(WeatherInitial()) {

    on<FetchWeather>((event, emit) async {  
      emit(WeatherLoading());
      try {
        Weather weather = await wf.currentWeatherByLocation(
            event.position.latitude, event.position.longitude);
        emit(WeatherSuccess(weather));
      } catch (e) {
        emit(const WeatherFailure("Failed to fetch weather by location."));
      }
    });

    on<SearchWeather>((event, emit) async {  
      emit(WeatherLoading());
      try {
        Weather weather = await wf.currentWeatherByCityName(event.cityName);
        emit(WeatherSuccess(weather));
      } catch (e) {
        emit(const WeatherFailure('City not found. Please try again.'));
      }
    });
  }
}
