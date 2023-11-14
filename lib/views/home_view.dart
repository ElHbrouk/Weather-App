import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/get_weather_cubit/get_weather_cubit.dart';
import 'package:weather_app/cubits/get_weather_cubit/get_weather_states.dart';
import 'package:weather_app/views/search_view.dart';

import '../widgets/no_weather_body.dart';
import '../widgets/weather_info_body.dart';


class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Weather App',
        ),
        centerTitle: true,
        actions: [
          IconButton(
            iconSize: 30,
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => const SearchView(),
                ),
              );
            },
            icon: const Icon(
              Icons.search,
            ),
          ),

        ],
      ),
      body: BlocBuilder<GetWeatherCubit, WeatherStates>(
        builder: (BuildContext context, state) {
          if (state is WeatherInitialState) {
            return const NoWeatherBody();
          } else if (state is WeatherLoadedState) {
            return WeatherInfoBody();
          } else {
            return const Center(
              child: Text(
                'oops,there is an error ',
                style: TextStyle(
                  fontSize: 30,
                ),
              ),
            );
          }
        },
      ),
    );
  }
}
