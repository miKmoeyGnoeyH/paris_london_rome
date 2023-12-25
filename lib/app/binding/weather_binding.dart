import 'package:get/get.dart';
import 'package:paris_london_rome/app/controller/weather_controller.dart';
import 'package:paris_london_rome/app/data/provider/weather_provider.dart';
import 'package:paris_london_rome/app/data/repository/weather_repository.dart';
import 'package:http/http.dart' as http;

class WeatherBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<WeatherController>(() {
      return WeatherController(
          weatherRepository: WeatherRepository(
              weatherProvider: WeatherProvider(httpClient: http.Client())));
    });
  }
}
