import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';
import 'package:weather_app/weather/bloc/weather_bloc.dart';
import 'package:weather_app/weather/repository/weather_repository.dart';
import 'package:weather_app/weather/views/search_weather_page.dart';

class WeatherInfoPage extends StatelessWidget {
  WeatherInfoPage({super.key});
  // WeatherRepo weatherRepo = WeatherRepo();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return BlocProvider(
      create: (context) => WeatherBloc(weatherRepo: WeatherRepo()),
      child: BlocBuilder<WeatherBloc, WeatherState>(
        builder: (context, state) {
          return Scaffold(
            backgroundColor: Colors.blue.shade200,
            appBar: AppBar(
              title: const Text('City here'),
              actions: [
                IconButton(
                    icon: const Icon(Icons.search),
                    onPressed: () =>
                        Navigator.of(context).push(SearchWeatherPage.route()))
              ],
            ),
            body: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 32),
              child: Column(
                children: [
                  InkWell(
                      onTap: () =>
                          context.read<WeatherBloc>().add(ClickSun('Hanoi')),
                      child: Lottie.asset('assets/4803-weather-storm.json')),
                  const SizedBox(
                    height: 20,
                  ),
                  Container(
                    width: size.width,
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.5),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(state.searchCityNameResult.toString() ??
                              state.loadStatus.toString()),
                          const SizedBox(
                            height: 10,
                          ),
                          Text(
                            // state.onClickText,
                            'vxid',
                            style: Theme.of(context).textTheme.displayMedium,
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Text('Weather Status here'),
                          const SizedBox(
                            height: 30,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Row(
                                children: [
                                  Icon(Icons.cyclone),
                                  const SizedBox(
                                    width: 5,
                                  ),
                                  Text('Wind speed'),
                                ],
                              ),
                              const SizedBox(
                                width: 15,
                              ),
                              Text('15km/h'),
                            ],
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
