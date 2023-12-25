import 'package:paris_london_rome/app/data/model/latlng_model.dart';
import 'package:paris_london_rome/app/data/provider/weather_provider.dart';

class WeatherRepository {
  final WeatherProvider weatherProvider;

  WeatherRepository({required this.weatherProvider});

  getWeather(LatLngModel latLng) {
    return weatherProvider.getWeather(latLng);
  }
}