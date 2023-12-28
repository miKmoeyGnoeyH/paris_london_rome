import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:location/location.dart';
import 'package:paris_london_rome/app/controller/memo_controller.dart';
import 'package:paris_london_rome/app/controller/weather_controller.dart';

import 'package:paris_london_rome/app/data/provider/latlng_provider.dart';
import 'package:paris_london_rome/app/data/provider/memo_provider.dart';
import 'package:paris_london_rome/app/data/provider/weather_provider.dart';
import 'package:paris_london_rome/app/data/repository/latlng_repository.dart';
import 'package:paris_london_rome/app/data/repository/memo_repository.dart';
import 'package:paris_london_rome/app/data/repository/weather_repository.dart';
import 'package:http/http.dart' as http;

import '../controller/map_controller.dart';

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
