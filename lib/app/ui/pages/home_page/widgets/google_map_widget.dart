import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:paris_london_rome/app/controller/home/map_controller.dart';

class GoogleMapWidget extends GetView<MapController> {
  const GoogleMapWidget({
    super.key,
    required this.width,
    required this.height,
  });

  final double width;
  final double height;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width * 0.5 - 15,
      height: height * 0.13,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          color: Colors.black.withAlpha(20),
          width: 0.5,
        ),
      ),
      clipBehavior: Clip.hardEdge,
      child: GetX<MapController>(
        initState: (state) {
          Get.find<MapController>().getLatLng();
        },
        builder: (_) {
          return _.latlng.latitude == null
              ? const Center(child: CircularProgressIndicator())
              : GoogleMap(
                  //liteModeEnabled: true,
                  rotateGesturesEnabled: false,
                  scrollGesturesEnabled: false,
                  zoomControlsEnabled: false,
                  zoomGesturesEnabled: false,
                  tiltGesturesEnabled: false,
                  mapToolbarEnabled: false,
                  //buildingsEnabled: false,
                  myLocationEnabled: true,
                  myLocationButtonEnabled: false,

                  initialCameraPosition: CameraPosition(
                    target: LatLng(_.latlng.latitude, _.latlng.longitude),
                    zoom: 11.0,
                  ),
                );
        },
      ),
    );
  }
}
