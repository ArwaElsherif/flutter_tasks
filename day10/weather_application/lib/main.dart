import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:weather_application/bloc/weather_bloc.dart';
import 'package:weather_application/data/determine_position.dart';
import 'package:weather_application/screens/home_screen.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: FutureBuilder(
          future: determinePosition(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Scaffold(
                body: Center(
                  child: CircularProgressIndicator(),
                ),
              );
            } else if (snapshot.hasError) {
              return Scaffold(
                body: Center(
                  child: Text('Error: ${snapshot.error}'),
                ),
              );
            } else if (snapshot.hasData) {
              return BlocProvider<WeatherBloc>(
                create: (context) =>
                    WeatherBloc()..add(FetchWeather(snapshot.data as Position)),
                child: const HomeScreen(),
              );
            } else {
              return const Scaffold(
                body: Center(
                  child: Text('No data available'),
                ),
              );
            }
          },
        ));
  }
}
