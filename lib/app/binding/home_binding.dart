import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:location/location.dart';
import 'package:paris_london_rome/app/controller/home/weather_controller.dart';

import 'package:paris_london_rome/app/data/provider/home_and_edit/memo_provider.dart';
import 'package:paris_london_rome/app/data/repository/home_and_edit/memo_repository.dart';
import 'package:http/http.dart' as http;

import '../controller/home/map_controller.dart';
import '../controller/home_and_edit/memo_controller.dart';
import '../data/provider/home/map/latlng_provider.dart';
import '../data/provider/home/weather/weather_provider.dart';
import '../data/repository/home/map/latlng_repository.dart';
import '../data/repository/home/weather/weather_repository.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MapController>(() => MapController(
        latLngRepository: LatLngRepository(
            latLngProvider: LatLngProvider(location: Location()))));
    Get.lazyPut<WeatherController>(() => WeatherController(
        weatherRepository: WeatherRepository(
            weatherProvider: WeatherProvider(httpClient: http.Client()))));
    Get.lazyPut<MemoController>(() => MemoController(
        memoRepository: MemoRepository(
            memoProvider:
                MemoProvider(getStorage: GetStorage()))));
  }
}
