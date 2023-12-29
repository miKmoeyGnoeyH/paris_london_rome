import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:paris_london_rome/app/controller/map_controller.dart';
import 'package:paris_london_rome/app/controller/weather_controller.dart';

const List<IconData> sky = [
  Icons.sunny,
  Icons.sunny,
  Icons.sunny,
  Icons.cloud_outlined,
  Icons.cloud
];

class WeatherWidget extends GetView<WeatherController> {
  const WeatherWidget({super.key, required this.width, required this.height});

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
        builder: (_) {
          return _.latlng.latitude == null
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : GetX<WeatherController>(
                  initState: (state) {
                    Get.find<WeatherController>().getWeather(_.latlng);
                  },
                  builder: (_) {
                    return _.weatherModel.tmp == null
                        ? const Center(
                            child: CircularProgressIndicator(),
                          )
                        : Center(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  sky[int.parse(_.weatherModel.sky)],
                                  // color: Colors.black.withAlpha(70),
                                  size: 64,
                                ),
                                const SizedBox(width: 10),
                                Text(
                                  '${_.weatherModel.tmp}℃',
                                  style: const TextStyle(
                                    fontSize: 20,
                                    // color: Colors.black.withAlpha(70),
                                  ),
                                ),
                              ],
                            ),
                          );
                  },
                );
        },
      ),
    );
  }
}
