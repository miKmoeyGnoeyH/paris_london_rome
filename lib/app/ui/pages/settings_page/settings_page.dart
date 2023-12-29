import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:paris_london_rome/app/controller/settings/theme_controller.dart';
import 'package:paris_london_rome/app/ui/pages/settings_page/widgets/settings_category_content_widget.dart';
import 'package:paris_london_rome/app/ui/pages/settings_page/widgets/settings_category_title_widget.dart';

import 'package:paris_london_rome/app/ui/widgets/custom_appbar.dart';

class SettingsPage extends GetView<ThemeContoller> {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    const String title = '설정';
    Get.put(ThemeContoller());

    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(50.0),
        child: CustomAppBar(
          title: title,
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SettingsCategoryTitleWidget(title: '애플리케이션 설정'),
          Column(
            children: [
              SettingsCategoryContentWidget(
                name: "어두운 테마 사용",
                child: SizedBox(
                  height: 14,
                  child: Switch(
                    value: controller.isDarkThemeChecked,
                    onChanged: (value) {
                      log(controller.isDarkThemeChecked.toString());
                      log(value.toString());
                      controller.isDarkThemeChecked =
                          !controller.isDarkThemeChecked;
                    },
                  ),
                ),
              ),
              const SettingsCategoryContentWidget(name: '폰트'),
              const SettingsCategoryContentWidget(name: '글씨 크기'),
            ],
          ),
          const SettingsCategoryTitleWidget(title: '애플리케이션 정보'),
          const Column(
            children: [
              SettingsCategoryContentWidget(
                name: '버전',
                child: Text('12345'),
              ),
              SettingsCategoryContentWidget(
                name: '개발자 이메일',
                child: Text('emailexample@example.com'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
