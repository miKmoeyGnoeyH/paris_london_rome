import '../../../model/home/map/latlng_model.dart';
import '../../../provider/home/weather/weather_provider.dart';

class WeatherRepository {
  final WeatherProvider weatherProvider;

  WeatherRepository({required this.weatherProvider});

  getWeather(LatLngModel latLng) {
    return weatherProvider.getWeather(latLng);
  }
}
