import 'package:get/get.dart';

class ThemeContoller extends GetxController {
  final _isDarkThemeChecked = false.obs;

  get isDarkThemeChecked => _isDarkThemeChecked.value;
  set isDarkThemeChecked(value) => _isDarkThemeChecked.value = value;

  switchTheme() {
    isDarkThemeChecked = !isDarkThemeChecked;
  }
}