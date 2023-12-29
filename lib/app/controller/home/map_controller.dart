import 'package:get/get.dart';

import '../../data/model/home/map/latlng_model.dart';
import '../../data/repository/home/map/latlng_repository.dart';

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
