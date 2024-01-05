import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class ThemeController extends GetxController {
  final themeStorage = GetStorage();

  final _theme = ThemeData().obs;
  get theme => _theme.value;
  set theme(value) => _theme.value = value;

  // isDarkMode
  final _isDarkMode = false.obs;
  get isDarkMode => _isDarkMode.value;
  set isDarkMode(value) {
    _isDarkMode.value = value;
    themeStorage.write(isDarkModeKey, value);
  }
  final isDarkModeKey = 'isDarkMode';

  // font
  final _font = 'Roboto'.obs;
  get font => _font.value;
  set font(value) {
    _font.value = value;
    themeStorage.write(fontKey, value);
  }
  final fontKey = 'font';

  // fontSize
  final _fontSize = 'Default'.obs;
  get fontSize => _fontSize.value;
  set fontSize(value) {
    _fontSize.value = value;
    themeStorage.write(fontSize, value);
  }
  final fontSizeKey = 'fontSize';

  ThemeController() {
    isDarkMode = themeStorage.read(isDarkModeKey) ?? false;
    font = themeStorage.read(fontKey) ?? 'Roboto';
    fontSize = themeStorage.read(fontSizeKey) ?? 'Default';
  }
}
