import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/get_weather_cubit/get_weather_cubit.dart';
import 'package:weather_app/cubits/get_weather_cubit/get_weather_states.dart';
import 'package:weather_app/services/weather_api.dart';

import 'views/home_view.dart';

void main() {
  WeatherService();
  runApp(const WeatherApp());
}

class WeatherApp extends StatelessWidget {
  const WeatherApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GetWeatherCubit(),
      child: Builder(
        builder: (context) => BlocBuilder<GetWeatherCubit, WeatherState>(
          builder: (context, state) {
            return MaterialApp(
              theme: ThemeData(
                  primarySwatch: getThemeColor(
                      BlocProvider.of<GetWeatherCubit>(context)
                          .weathermodel
                          ?.condition)),
              home: HomeView(),
            );
          },
        ),
      ),
    );
  }
}

// class custommaterialapp extends StatelessWidget {
//   const custommaterialapp({
//     super.key,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       theme: ThemeData(
//           primarySwatch: getThemeColor(BlocProvider.of<GetWeatherCubit>(context)
//               .weathermodel?.condition)),
//       home: HomeView(),
//     );
//   }
// }

MaterialColor getThemeColor(String? condition) {
  if (condition == null) {
    return Colors.blue;
  } else if (condition.toLowerCase() == "sunny") {
    return Colors.amber; // Sunny
  } else if (condition.toLowerCase() == "partly cloudy") {
    return Colors.blueGrey; // Partly cloudy
  } else if (condition.toLowerCase() == "cloudy") {
    return Colors.grey; // Cloudy
  } else if (condition.toLowerCase() == "overcast") {
    return Colors.blueGrey; // Overcast
  } else if (condition.toLowerCase() == "mist") {
    return Colors.teal; // Mist
  } else if (condition.toLowerCase() == "patchy rain possible") {
    return Colors.blue; // Patchy rain possible
  } else if (condition.toLowerCase() == "patchy snow possible") {
    return Colors.lightBlue; // Patchy snow possible
  } else if (condition.toLowerCase() == "patchy sleet possible") {
    return Colors.cyan; // Patchy sleet possible
  } else if (condition.toLowerCase() == "patchy freezing drizzle possible") {
    return Colors.cyan; // Patchy freezing drizzle possible
  } else if (condition.toLowerCase() == "thundery outbreaks possible") {
    return Colors.deepPurple; // Thundery outbreaks possible
  } else if (condition.toLowerCase() == "blowing snow") {
    return Colors.blueGrey; // Blowing snow
  } else if (condition.toLowerCase() == "blizzard") {
    return Colors.blueGrey; // Blizzard
  } else if (condition.toLowerCase() == "fog") {
    return Colors.grey; // Fog
  } else if (condition.toLowerCase() == "freezing fog") {
    return Colors.grey; // Freezing fog
  } else if (condition.toLowerCase() == "patchy light drizzle") {
    return Colors.lightBlue; // Patchy light drizzle
  } else if (condition.toLowerCase() == "light drizzle") {
    return Colors.lightBlue; // Light drizzle
  } else if (condition.toLowerCase() == "freezing drizzle") {
    return Colors.cyan; // Freezing drizzle
  } else if (condition.toLowerCase() == "heavy freezing drizzle") {
    return Colors.cyan; // Heavy freezing drizzle
  } else if (condition.toLowerCase() == "patchy light rain") {
    return Colors.lightBlue; // Patchy light rain
  } else if (condition.toLowerCase() == "light rain") {
    return Colors.lightBlue; // Light rain
  } else if (condition.toLowerCase() == "moderate rain at times") {
    return Colors.blue; // Moderate rain at times
  } else if (condition.toLowerCase() == "moderate rain") {
    return Colors.blue; // Moderate rain
  } else if (condition.toLowerCase() == "heavy rain at times") {
    return Colors.blue; // Heavy rain at times
  } else if (condition.toLowerCase() == "heavy rain") {
    return Colors.blue; // Heavy rain
  } else if (condition.toLowerCase() == "light freezing rain") {
    return Colors.cyan; // Light freezing rain
  } else if (condition.toLowerCase() == "moderate or heavy freezing rain") {
    return Colors.cyan; // Moderate or heavy freezing rain
  } else if (condition.toLowerCase() == "light sleet") {
    return Colors.lightBlue; // Light sleet
  } else if (condition.toLowerCase() == "moderate or heavy sleet") {
    return Colors.lightBlue; // Moderate or heavy sleet
  } else if (condition.toLowerCase() == "patchy light snow") {
    return Colors.lightBlue; // Patchy light snow
  } else if (condition.toLowerCase() == "light snow") {
    return Colors.lightBlue; // Light snow
  } else if (condition.toLowerCase() == "patchy moderate snow") {
    return Colors.lightBlue; // Patchy moderate snow
  } else if (condition.toLowerCase() == "moderate snow") {
    return Colors.lightBlue; // Moderate snow
  } else if (condition.toLowerCase() == "patchy heavy snow") {
    return Colors.lightBlue; // Patchy heavy snow
  } else if (condition.toLowerCase() == "heavy snow") {
    return Colors.lightBlue; // Heavy snow
  } else if (condition.toLowerCase() == "ice pellets") {
    return Colors.cyan; // Ice pellets
  } else if (condition.toLowerCase() == "light rain shower") {
    return Colors.lightBlue; // Light rain shower
  } else if (condition.toLowerCase() == "moderate or heavy rain shower") {
    return Colors.blue; // Moderate or heavy rain shower
  } else if (condition.toLowerCase() == "torrential rain shower") {
    return Colors.blue; // Torrential rain shower
  } else if (condition.toLowerCase() == "light sleet showers") {
    return Colors.cyan; // Light sleet showers
  } else if (condition.toLowerCase() == "moderate or heavy sleet showers") {
    return Colors.cyan; // Moderate or heavy sleet showers
  } else if (condition.toLowerCase() == "light snow showers") {
    return Colors.lightBlue; // Light snow showers
  } else if (condition.toLowerCase() == "moderate or heavy snow showers") {
    return Colors.lightBlue; // Moderate or heavy snow showers
  } else if (condition.toLowerCase() == "light showers of ice pellets") {
    return Colors.cyan; // Light showers of ice pellets
  } else if (condition.toLowerCase() ==
      "moderate or heavy showers of ice pellets") {
    return Colors.cyan; // Moderate or heavy showers of ice pellets
  } else if (condition.toLowerCase() == "patchy light rain with thunder") {
    return Colors.deepPurple; // Patchy light rain with thunder
  } else if (condition.toLowerCase() == "moderate or heavy rain with thunder") {
    return Colors.deepPurple; // Moderate or heavy rain with thunder
  } else if (condition.toLowerCase() == "patchy light snow with thunder") {
    return Colors.deepPurple; // Patchy light snow with thunder
  } else if (condition.toLowerCase() == "moderate or heavy snow with thunder") {
    return Colors.deepPurple; // Moderate or heavy snow with thunder
  } else {
    return Colors.grey; // Default color if condition is not recognized
  }
}
