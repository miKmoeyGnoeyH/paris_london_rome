import 'package:get/get.dart';
import 'package:paris_london_rome/app/binding/google_map_binding.dart';
import 'package:paris_london_rome/app/binding/weather_binding.dart';
import 'package:paris_london_rome/app/ui/edit/edit_page.dart';
import 'package:paris_london_rome/app/ui/home/home_page.dart';
import 'package:paris_london_rome/app/ui/settings/settings_page.dart';

part 'app_routes.dart';

class AppPages {
  static final pages = [
    GetPage(
      name: Routes.homePage,
      page: () => const HomePage(),
      bindings: [
        GoogleMapBinding(),
        WeatherBinding(),
      ],
    ),
    GetPage(
      name: Routes.settingsPage,
      page: () => const SettingsPage(),
    ),
    GetPage(
      name: Routes.editPage,
      page: () => const EditPage(),
    ),
  ];
}
