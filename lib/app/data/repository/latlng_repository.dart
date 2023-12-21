import 'package:paris_london_rome/app/data/provider/latlng_provider.dart';

class LatLngRepository {
  final LatLngProvider latLngProvider;

  LatLngRepository({required this.latLngProvider});

  getLatLng() {
    return latLngProvider.getLatLng();
  }
}