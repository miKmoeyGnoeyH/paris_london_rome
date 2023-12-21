import 'package:get/get.dart';
import 'package:location/location.dart';
import 'package:paris_london_rome/app/controller/map_controller.dart';
import 'package:paris_london_rome/app/data/provider/latlng_provider.dart';
import 'package:paris_london_rome/app/data/repository/latlng_repository.dart';

class GoogleMapBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MapController>(
      () {
        return MapController(
          latLngRepository: LatLngRepository(
            latLngProvider: LatLngProvider(
              location: Location(),
            ),
          ),
        );
      },
    );
  }
}
