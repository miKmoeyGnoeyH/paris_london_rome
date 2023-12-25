import 'dart:async';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:paris_london_rome/app/binding/home_binding.dart';
import 'package:paris_london_rome/app/routes/app_pages.dart';

import 'app/ui/splash_screen/splash_screen.dart';

void main() {
  runZonedGuarded(() {
    WidgetsFlutterBinding.ensureInitialized();
    FlutterError.onError = (details) {
      log('Error inside of flutter framework');
      FlutterError.presentError(details);
    };
    runApp(
      GetMaterialApp(
        debugShowCheckedModeBanner: false,
        getPages: AppPages.pages,
        initialRoute: Routes.homePage,
        initialBinding: HomeBinding(),
        home: const SplashScreen(),
      ),
    );
  }, (error, stack) {
    log('Error outside of flutter framework');
  });
}
