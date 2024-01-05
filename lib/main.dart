import 'dart:async';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:paris_london_rome/app/binding/home_binding.dart';
import 'package:paris_london_rome/app/controller/settings/theme_controller.dart';
import 'package:paris_london_rome/app/routes/app_pages.dart';
import 'package:paris_london_rome/app/ui/theme/theme.dart';

import 'app/ui/splash_screen/splash_screen.dart';

void main() {
  runZonedGuarded(() async {
    WidgetsFlutterBinding.ensureInitialized();
    await GetStorage.init();

    FlutterError.onError = (details) {
      log('Error inside of flutter framework');
      FlutterError.presentError(details);
    };
    runApp(
      const App(),
    );
  }, (error, stack) {
    log('Error outside of flutter framework');
  });
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    final ThemeController themeController = Get.put(ThemeController());

    return GetX<ThemeController>(
      builder: (_) => GetMaterialApp(
        debugShowCheckedModeBanner: false,
        getPages: AppPages.pages,
        initialRoute: Routes.homePage,
        initialBinding: HomeBinding(),
        theme: _.isDarkMode
            ? ThemeData(
                fontFamily: themeController.font,
                colorScheme: darkColorScheme,
                textTheme: defineTextTheme(_.fontSize),
              )
            : ThemeData(
                fontFamily: themeController.font,
                colorScheme: lightColorScheme,
                textTheme: defineTextTheme(_.fontSize),
              ),
        home: const SplashScreen(),
      ),
    );
  }
}
