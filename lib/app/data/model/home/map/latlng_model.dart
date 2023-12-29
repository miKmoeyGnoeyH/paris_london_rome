import 'package:location/location.dart';

class LatLngModel {
  double? latitude;
  double? longitude;

  LatLngModel({latitude, longitude});

  LatLngModel.fromLocationData(LocationData ld)
      : latitude = ld.latitude,
        longitude = ld.longitude;
}
