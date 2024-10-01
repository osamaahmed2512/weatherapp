import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/get_weather_cubit/get_weather_cubit.dart';
import 'package:weather_app/cubits/get_weather_cubit/get_weather_states.dart';
import 'package:weather_app/views/search_view.dart';
import 'package:weather_app/widgets/no_weather_body.dart';
import 'package:weather_app/widgets/weather_info_body.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Weather App'),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => SearchView(),
              ));
            },
            icon: Icon(Icons.search),
          ),
        ],
      ),
      body: BlocBuilder<GetWeatherCubit,WeatherState>(
        builder: (context, state) {
          if (state is NoWeatherState) {
            return const NoWeatherBody();
          }
          else if (state is WeatherLoadedState){
            // return WeatherInfoBody(weatherModel: state.weatherModel,);
            return WeatherInfoBody();
          }
          else {
            return const Text("oops their was an error");
          }
          
        },
      ),

    );
  
}
}

// create states 
// create cubit 
// create function 
// provide cubit 
// integrate cubit 
// trigger cubit 
