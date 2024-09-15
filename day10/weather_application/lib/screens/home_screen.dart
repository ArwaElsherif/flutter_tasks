import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:weather_application/bloc/weather_bloc.dart';
import 'package:weather_application/data/get_weather_icon.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController cityController = TextEditingController();

    return Scaffold(
      resizeToAvoidBottomInset: false,
      extendBodyBehindAppBar: true,
      backgroundColor: Colors.black,
      body: Padding(
        padding: const EdgeInsets.fromLTRB(40, 0.8 * kToolbarHeight, 40, 20),
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          child: Stack(
            children: [
              Align(
                alignment: const AlignmentDirectional(3, -0.3),
                child: Container(
                  height: 300,
                  width: 300,
                  decoration: const BoxDecoration(
                      shape: BoxShape.circle, color: Colors.deepPurple),
                ),
              ),
              Align(
                alignment: const AlignmentDirectional(-3, -0.3),
                child: Container(
                  height: 300,
                  width: 300,
                  decoration: const BoxDecoration(
                      shape: BoxShape.circle, color: Colors.deepPurple),
                ),
              ),
              Align(
                alignment: const AlignmentDirectional(0, -1.2),
                child: Container(
                  height: 300,
                  width: 300,
                  decoration: const BoxDecoration(color: Color(0xFFFFAB40)),
                ),
              ),
              BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 100, sigmaY: 100),
                child: Container(
                  decoration: const BoxDecoration(color: Colors.transparent),
                ),
              ),
              BlocBuilder<WeatherBloc, WeatherState>(builder: (context, state) {
                if (state is WeatherLoading) {
                  return const Center(child: CircularProgressIndicator());
                } else if (state is WeatherFailure) {
                  return Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextField(
                          controller: cityController,
                          style: const TextStyle(color: Colors.white),
                          textInputAction: TextInputAction.search,
                          onSubmitted: (value) {
                            if (value.isNotEmpty) {
                              BlocProvider.of<WeatherBloc>(context)
                                  .add(SearchWeather(value));
                              cityController.clear();
                            }
                          },
                          decoration: InputDecoration(
                            suffixIcon: const Icon(Icons.search, color: Colors.white),
                            hintStyle: const TextStyle(color: Colors.white),
                            hintText: 'Search',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: const BorderSide(color: Colors.white),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                      Text(
                        state.message,
                        style: const TextStyle(
                          color: Colors.redAccent,
                          fontSize: 18,
                        ),
                      ),
                    ],
                  );
                } else if (state is WeatherSuccess) {
                  return SingleChildScrollView(
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: TextField(
                            controller: cityController,
                            style: const TextStyle(
                              color: Colors.white,
                            ),
                            textInputAction: TextInputAction.search,
                            onSubmitted: (value) {
                              BlocProvider.of<WeatherBloc>(context).add(SearchWeather(value));
                              cityController.clear();
                            },
                            decoration: InputDecoration(
                              suffixIcon: const Icon(
                                Icons.search,
                                color: Colors.white,
                              ),
                              hintStyle: const TextStyle(color: Colors.white),
                              hintText: 'Search',
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: const BorderSide(color: Colors.white),
                              ),
                            ),
                          ),
                        ),
                        Align(
                          alignment: Alignment.topLeft,
                          child: Text(
                            "📍: ${state.weather.country}",
                            style: const TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.w400,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        Align(
                          alignment: Alignment.topLeft,
                          child: Text(
                            "${state.weather.areaName}",
                            style: const TextStyle(
                              fontSize: 32,
                              fontWeight: FontWeight.w500,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        const SizedBox(height: 10),
                        GetWeatherIcon(code: state.weather.weatherConditionCode!),
                        const SizedBox(height: 6),
                        Text(
                          '${state.weather.temperature!.celsius?.round()} °C',
                          style: const TextStyle(
                            fontSize: 54,
                            color: Colors.white,
                            fontWeight: FontWeight.w500,
                            letterSpacing: 1,
                          ),
                        ),
                        Text(
                          state.weather.weatherMain!.toLowerCase(),
                          style: const TextStyle(
                            fontSize: 34,
                            color: Colors.white,
                            fontWeight: FontWeight.w300,
                            letterSpacing: 2,
                          ),
                        ),
                        const SizedBox(height: 10),
                        Text(
                          DateFormat('EEEE dd •').add_jm().format(state.weather.date!),
                          style: const TextStyle(
                            fontSize: 24,
                            color: Colors.white,
                            fontWeight: FontWeight.w300,
                            letterSpacing: 1,
                          ),
                        ),
                        const SizedBox(height: 18),
                        buildWeatherDetails(state),
                      ],
                    ),
                  );
                } else {
                  return const Center(child: CircularProgressIndicator());
                }
              }),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildWeatherDetails(WeatherSuccess state) {
    return Column(
      children: [
        Row(
          children: [
            const Image(
              image: AssetImage('assets/11.png'),
              width: 50,
              height: 50,
            ),
            buildDetailColumn(
              title: 'Sunrise',
              value: DateFormat().add_jm().format(state.weather.sunrise!),
            ),
            const SizedBox(width: 10),
            const Image(
              image: AssetImage('assets/12.png'),
              width: 50,
              height: 50,
            ),
            buildDetailColumn(
              title: 'Sunset',
              value: DateFormat().add_jm().format(state.weather.sunset!),
            ),
          ],
        ),
        const Padding(
          padding: EdgeInsets.only(top: 8, bottom: 8),
          child: Divider(
            indent: 5,
            endIndent: 5,
            color: Colors.grey,
            thickness: 0.5,
          ),
        ),
        Row(
          children: [
            const Image(
              image: AssetImage('assets/13.png'),
              width: 50,
              height: 50,
            ),
            buildDetailColumn(
              title: 'Temp Max',
              value: '${state.weather.tempMax?.celsius?.round() ?? '--'} °C',
            ),
            const Image(
              image: AssetImage('assets/14.png'),
              width: 50,
              height: 50,
            ),
            buildDetailColumn(
              title: 'Temp Min',
              value: '${state.weather.tempMin?.celsius?.round() ?? '--'} °C',
            ),
          ],
        ),
      ],
    );
  }

  Widget buildDetailColumn({required String title, required String value}) {
    return Padding(
      padding: const EdgeInsets.only(left: 8, right: 8, top: 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 18,
              color: Colors.white,
              fontWeight: FontWeight.w400,
              letterSpacing: 2,
            ),
          ),
          Text(
            value,
            style: const TextStyle(
              fontSize: 20,
              color: Colors.white,
              fontWeight: FontWeight.bold,
              letterSpacing: 2,
            ),
          ),
        ],
      ),
    );
  }
}
