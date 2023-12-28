import 'dart:developer';

import 'package:get/get.dart';
import 'package:paris_london_rome/app/data/model/latlng_model.dart';
import 'package:paris_london_rome/app/data/model/weather_model.dart';

import '../data/repository/weather_repository.dart';

class WeatherController extends GetxController {
  final WeatherRepository weatherRepository;

  WeatherController({required this.weatherRepository});

  final _weatherModel = WeatherModel().obs;

  get weatherModel => _weatherModel.value;

  set weatherModel(value) => _weatherModel.value = value;

  getWeather(LatLngModel latlng) {
    log('latlng : ${latlng.latitude}, ${latlng.longitude}');
    weatherRepository.getWeather(latlng).then((data) {
      weatherModel = data;
    });
  }
}
