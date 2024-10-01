import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/get_weather_cubit/get_weather_states.dart';
import 'package:weather_app/models/weather_model.dart';
import 'package:weather_app/services/weather_api.dart';

class GetWeatherCubit extends Cubit<WeatherState> {
  GetWeatherCubit() : super(NoWeatherState());
   WeatherModel? weathermodel;
  getweather({required String cityname}) async {
    try {
       weathermodel =
          await WeatherService().getcurrentweather(cityname: cityname);
      emit(WeatherLoadedState(weathermodel!));
    } catch (e) {
      emit(WeatherFailureState(e.toString()));
    }
  }
}
