import '../../../provider/home/map/latlng_provider.dart';

class LatLngRepository {
  final LatLngProvider latLngProvider;

  LatLngRepository({required this.latLngProvider});

  getLatLng() {
    return latLngProvider.getLatLng();
  }
}
