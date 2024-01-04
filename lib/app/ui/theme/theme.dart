import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class ThemeController extends GetxController {
  final themeStorage = GetStorage();

  final _isDarkMode = false.obs;
  get isDarkMode => _isDarkMode.value;
  set isDarkMode(value) => _isDarkMode.value = value;
  final isDarkModeKey = 'isDarkMode';

  final _font = 'Roboto'.obs;
  get font => _font.value;
  set font(value) => _font.value = value;
  final fontKey = 'font';

  final _fontSize = 'Default'.obs;
  get fontSize => _fontSize.value;
  set fontSize(value) => _fontSize.value = value;
  final fontSizeKey = 'fontSize';

  ThemeController() {
    isDarkMode = themeStorage.read(isDarkModeKey);
    font = themeStorage.read(fontKey);
    fontSize = themeStorage.read(fontSizeKey);
  }

  get theme => isDarkMode
      ? ThemeData(
          fontFamily: font,
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
          textTheme: const TextTheme(
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
          ),
        )
      : ThemeData(
          fontFamily: font,
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
          textTheme: const TextTheme(
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
          ),
        );
}
