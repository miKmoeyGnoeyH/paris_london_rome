import 'package:location/location.dart';

import '../../../model/home/map/latlng_model.dart';

class LatLngProvider {
  final Location location;

  LatLngProvider({required this.location});

  getLatLng() async {
    bool serviceEnabled;
    PermissionStatus permissionGranted;
    LocationData locationData;

    serviceEnabled = await location.serviceEnabled();
    if (!serviceEnabled) {
      serviceEnabled = await location.requestService();
      if (!serviceEnabled) return;
    }

    permissionGranted = await location.hasPermission();
    if (permissionGranted == PermissionStatus.denied) {
      permissionGranted = await location.requestPermission();
      if (permissionGranted != PermissionStatus.granted) return;
    }

    locationData = await location.getLocation();
    LatLngModel latLng = LatLngModel.fromLocationData(locationData);

    return latLng;
  }
}
