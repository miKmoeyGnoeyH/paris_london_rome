import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import 'package:gradient_borders/gradient_borders.dart';
import 'package:paris_london_rome/app/ui/widgets/settings_button.dart';

import '../../controller/home_controller.dart';
import '../../routes/app_pages.dart';
import '../widgets/custom_appbar.dart';
import 'widgets/google_map_widget.dart';

class HomePage extends GetView<HomeController> {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    const String title = 'ParisLondonRome';

    final double width = MediaQuery.of(context).size.width;
    final double height = MediaQuery.of(context).size.height;

    //googlemap test
    late GoogleMapController mapController;
    const LatLng center = LatLng(45.521563, -122.677433);
    void onMapCreated(GoogleMapController controller) {
      mapController = controller;
    }

    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(50),
        child: CustomAppBar(
          title: title,
          leading: Settings(),
        ),
      ),
      body:
      Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GoogleMapWidget(width: width, height: height, center: center),
                Container(
                  width: width * 0.5 - 15,
                  height: height * 0.13,
                  decoration: BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                      color: Colors.black.withAlpha(20),
                      width: 0.5,
                    ),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
      floatingActionButton: SizedBox(
        width: width * 0.2,
        height: width * 0.2,
        child: FloatingActionButton(
          backgroundColor: Colors.white,
          shape: GradientOutlineInputBorder(
            gradient: const LinearGradient(
              colors: [
                Color(0xffCBFFF5),
                Color(0xffFFD9E7),
                Color(0xffFFF8C1),
              ],
            ),
            width: 3,
            borderRadius: BorderRadius.circular(50),
          ),
          onPressed: () => Get.toNamed(Routes.editPage),
          child: const Icon(
            Icons.add,
            size: 40,
          ),
        ),
      ),
    );
  }
}

