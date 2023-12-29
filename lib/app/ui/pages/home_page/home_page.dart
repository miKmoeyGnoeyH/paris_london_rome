import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:paris_london_rome/app/controller/home_and_edit/memo_controller.dart';

import 'package:paris_london_rome/app/ui/pages/home_page/widgets/add_memo_floating_button.dart';
import 'package:paris_london_rome/app/ui/pages/home_page/widgets/google_map_widget.dart';
import 'package:paris_london_rome/app/ui/pages/home_page/widgets/memos_list_view_widget.dart';
import 'package:paris_london_rome/app/ui/pages/home_page/widgets/weather_widget.dart';
import 'package:paris_london_rome/app/ui/widgets/settings_button.dart';

import '../../widgets/custom_appbar.dart';

class HomePage extends GetView<MemoController> {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    const String title = 'ParisLondonRome';

    final double width = MediaQuery.of(context).size.width;
    final double height = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(50),
        child: CustomAppBar(
          title: title,
          leading: Settings(),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        child: SingleChildScrollView(
          clipBehavior: Clip.none,
          child: Column(
            children: [
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GoogleMapWidget(width: width, height: height),
                  WeatherWidget(width: width, height: height),
                ],
              ),
              const SizedBox(height: 10),
              MemosListViewWidget(
                  controller: controller, height: height, width: width)
            ],
          ),
        ),
      ),
      floatingActionButton:
          AddMemoFloatingButton(width: width, controller: controller),
    );
  }
}
