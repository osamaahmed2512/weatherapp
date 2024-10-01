

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/get_weather_cubit/get_weather_cubit.dart';



class SearchView extends StatelessWidget {
  const SearchView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Search View"),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 16,
        ),
        child: Center(
          child: TextField(
            onSubmitted: (value) async {
              var getweathercubit = BlocProvider.of<GetWeatherCubit>(context);
              getweathercubit.getweather(cityname: value);
              Navigator.of(context).pop();
            },
            decoration: const InputDecoration(
              contentPadding:
                  EdgeInsets.symmetric(vertical: 32, horizontal: 16),
              labelText: "search",
              suffixIcon: Icon(Icons.search),
              hintText: "enter city name ",
              border: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.green)),
            ),
          ),
        ),
      ),
    );
  }
}


