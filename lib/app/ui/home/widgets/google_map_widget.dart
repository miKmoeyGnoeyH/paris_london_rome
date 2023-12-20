import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:paris_london_rome/app/controller/map_controller.dart';

class GoogleMapWidget extends GetView<MapController> {
  const GoogleMapWidget({
    super.key,
    required this.width,
    required this.height,
    required this.center,
  });

  final double width;
  final double height;
  final LatLng center;

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
      child: GoogleMap(
        myLocationButtonEnabled: false,
        initialCameraPosition: CameraPosition(
          target: center,
          zoom: 11.0,
        ),
      ),
    );
  }
}
