import 'dart:developer';

import 'package:get/get.dart';

import '../../data/model/home/map/latlng_model.dart';
import '../../data/model/home/weather/weather_model.dart';
import '../../data/repository/home/weather/weather_repository.dart';

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
