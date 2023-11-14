import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/get_weather_cubit/get_weather_states.dart';
import 'package:weather_app/models/weather_model.dart';
import 'package:weather_app/views/home_view.dart';

import 'cubits/get_weather_cubit/get_weather_cubit.dart';

void main() {
  runApp(const MyApp());
}



class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) {
        return GetWeatherCubit();
      },
      child: Builder(
        builder: (context) {
          return BlocBuilder<GetWeatherCubit,WeatherStates>(
            builder: (context,state) {
              return MaterialApp(
                debugShowCheckedModeBanner: false,
                theme: ThemeData(

                  primarySwatch: getThemeColor(
                    BlocProvider.of<GetWeatherCubit>(context)
                        .weatherModel?.conditionText,
                  ),
                ),
                home: const HomeView(),
              );
            }
          );
        }
      ),
    );
  }


}
MaterialColor getThemeColor(String? condition) {
  if (condition == null)
  {
    return Colors.blue;
  }
  switch (condition) {
    case 'Sunny':
      return Colors.orange;
    case 'Clear':
      return Colors.cyan;
    case 'Partly cloudy':
      return Colors.pink;
    case 'Cloudy':
      return Colors.grey;
    case 'Overcast':
      return Colors.green;
    case 'Mist':
      return Colors.teal;

    case 'Patchy light drizzle':
    case 'Light drizzle':
      return Colors.lime;
    case 'Freezing drizzle':
    case 'Heavy freezing drizzle':
      return Colors.brown;
    case 'Patchy light rain':
    case 'Light rain':
    case 'Moderate rain at times':
    case 'Moderate rain':
    case 'Heavy rain at times':
    case 'Heavy rain':
      return Colors.blueGrey;
    case 'Patchy light snow':
    case 'Light snow':
    case 'Patchy moderate snow':
    case 'Moderate snow':
      return Colors.green;
    case 'Patchy heavy snow':
    case 'Heavy snow':
      return Colors.amber;

    case 'Ice pellets':
      return Colors.indigo;

    case 'Light rain shower':
    case 'Moderate or heavy rain shower':
    case 'Torrential rain shower':
      return Colors.blueGrey;
    case 'Light sleet showers':
    case 'Moderate or heavy sleet showers':
      return Colors.red;
    case 'Light snow showers':
    case 'Moderate or heavy snow showers':
      return Colors.teal;
    case 'Light showers of ice pellets':
    case 'Moderate or heavy showers of ice pellets':
      return Colors.orange;

    case 'Patchy light rain with thunder':
    case 'Moderate or heavy rain with thunder':
      return Colors.blueGrey;
    case 'Patchy light snow with thunder':
      return Colors.lightBlue;

    default:
      return Colors.grey;
  }
}