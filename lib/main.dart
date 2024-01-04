import 'dart:async';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:paris_london_rome/app/binding/home_binding.dart';
import 'package:paris_london_rome/app/controller/settings/theme_controller.dart';
import 'package:paris_london_rome/app/routes/app_pages.dart';

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
                colorScheme: const ColorScheme(
                  brightness: Brightness.dark,
                  primary: Color(0xffcbfff5),
                  onPrimary: Colors.black,
                  secondary: Color(0xffffd9e7),
                  onSecondary: Colors.black,
                  tertiary: Color(0xfffff8c1),
                  onTertiary: Colors.black,
                  background: Colors.black,
                  onBackground: Colors.white,
                  surface: Colors.black,
                  onSurface: Colors.white,
                  error: Colors.red,
                  onError: Colors.yellow,
                ),
                textTheme: (() {
                  switch (_.fontSize) {
                    case 'Small':
                      return const TextTheme(
                        displayLarge: TextStyle(
                          fontSize: 35,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                        titleLarge: TextStyle(
                          fontSize: 14,
                          color: Colors.white,
                        ),
                        titleMedium: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.normal,
                          color: Colors.white,
                        ),
                        bodyLarge: TextStyle(
                          fontSize: 12,
                          color: Colors.white,
                        ),
                        bodyMedium: TextStyle(
                          fontSize: 10,
                          color: Colors.white,
                        ),
                      );
                    case 'Default':
                      return const TextTheme(
                        displayLarge: TextStyle(
                          fontSize: 35,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                        titleLarge: TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                        ),
                        titleMedium: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.normal,
                          color: Colors.white,
                        ),
                        bodyLarge: TextStyle(
                          fontSize: 14,
                          color: Colors.white,
                        ),
                        bodyMedium: TextStyle(
                          fontSize: 12,
                          color: Colors.white,
                        ),
                      );
                    case 'Large':
                      return const TextTheme(
                        displayLarge: TextStyle(
                          fontSize: 35,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                        titleLarge: TextStyle(
                          fontSize: 24,
                          color: Colors.white,
                        ),
                        titleMedium: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.normal,
                          color: Colors.white,
                        ),
                        bodyLarge: TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                        ),
                        bodyMedium: TextStyle(
                          fontSize: 14,
                          color: Colors.white,
                        ),
                      );
                  }
                })(),
              )
            : ThemeData(
                fontFamily: themeController.font,
                colorScheme: const ColorScheme(
                  brightness: Brightness.light,
                  primary: Color(0xffcbfff5),
                  onPrimary: Colors.black,
                  secondary: Color(0xffffd9e7),
                  onSecondary: Colors.black,
                  tertiary: Color(0xfffff8c1),
                  onTertiary: Colors.black,
                  background: Colors.white,
                  onBackground: Colors.black,
                  surface: Colors.white,
                  onSurface: Colors.black,
                  error: Colors.red,
                  onError: Colors.yellow,
                ),
                textTheme: (() {
                  switch (_.fontSize) {
                    case 'Small':
                      return const TextTheme(
                        displayLarge: TextStyle(
                          fontSize: 35,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                        titleLarge: TextStyle(
                          fontSize: 14,
                          color: Colors.black,
                        ),
                        titleMedium: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.normal,
                          color: Colors.black,
                        ),
                        bodyLarge: TextStyle(
                          fontSize: 12,
                          color: Colors.black,
                        ),
                        bodyMedium: TextStyle(
                          fontSize: 10,
                          color: Colors.black,
                        ),
                      );
                    case 'Default':
                      return const TextTheme(
                        displayLarge: TextStyle(
                          fontSize: 35,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                        titleLarge: TextStyle(
                          fontSize: 20,
                          color: Colors.black,
                        ),
                        titleMedium: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.normal,
                          color: Colors.black,
                        ),
                        bodyLarge: TextStyle(
                          fontSize: 14,
                          color: Colors.black,
                        ),
                        bodyMedium: TextStyle(
                          fontSize: 12,
                          color: Colors.black,
                        ),
                      );
                    case 'Large':
                      return const TextTheme(
                        displayLarge: TextStyle(
                          fontSize: 35,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                        titleLarge: TextStyle(
                          fontSize: 24,
                          color: Colors.black,
                        ),
                        titleMedium: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.normal,
                          color: Colors.black,
                        ),
                        bodyLarge: TextStyle(
                          fontSize: 20,
                          color: Colors.black,
                        ),
                        bodyMedium: TextStyle(
                          fontSize: 14,
                          color: Colors.black,
                        ),
                      );
                  }
                })(),
              ),
        home: const SplashScreen(),
      ),
    );
  }
}
