import 'package:get/get.dart';
import 'package:paris_london_rome/app/data/repository/latlng_repository.dart';

import '../data/model/latlng_model.dart';

class MapController extends GetxController {
  final LatLngRepository latLngRepository;

  MapController({required this.latLngRepository});

  final _latlng = LatLngModel().obs;

  get latlng => _latlng.value;

  set latlng(value) => _latlng.value = value;

  getLatLng() {
    latLngRepository.getLatLng().then((data) {
      latlng = data;
    });
  }
}
