import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/get_weather_cubit/get_weather_cubit.dart';
import 'package:weather_app/main.dart';
import 'package:weather_app/models/weather_model.dart';
// import 'package:weather_app/models/weather_model.dart';

class WeatherInfoBody extends StatelessWidget {
  // const WeatherInfoBody({Key? key, required this.weatherModel}) : super(key: key);
  const WeatherInfoBody({Key? key}) : super(key: key);
  // final WeatherModel weatherModel;
  @override
  Widget build(BuildContext context) {
     WeatherModel weatherModel= BlocProvider.of<GetWeatherCubit>(context).weathermodel!;
    return Container(
      decoration:  BoxDecoration(
        gradient: LinearGradient(
          colors: [getThemeColor(weatherModel.condition),getThemeColor(weatherModel.condition).withOpacity(0.2) ],
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
          stops:const [
            0.1,
            0.5
          ]
          )
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
             Text(
             weatherModel.cityname ,
              style:const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 32,
              ),
            ),
             Text(
              // 'updated at ${stringtodatetime(weatherModel.date).hour}',
              'updated at ${weatherModel.date.hour}:${weatherModel.date.minute}',
              style:const  TextStyle(
                fontSize: 24,
              ),
            ),
            const SizedBox(
              height: 32,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image.network(
                  "https:${weatherModel.image!}",
                ),
                 Text(
                  weatherModel.temp.toString(),
                  style:const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 32,
                  ),
                ),
                 Column(
                  children: [
                    Text(
                      'Maxtemp: ${weatherModel.maxtemp.round()}',
                      style: TextStyle(
                        fontSize: 16,
                      ),
                    ),
                    Text(
                      'Mintemp: ${weatherModel.mintemp.round()}',
                      style: TextStyle(
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(
              height: 32,
            ),
             Text(
              weatherModel.condition,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 32,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// DateTime stringtodatetime(String value){
//   return DateTime.parse(value);
// }