import 'package:get/get.dart';

import '../ui/pages/edit_page/edit_page.dart';
import '../ui/pages/home_page/home_page.dart';
import '../ui/pages/settings_page/settings_page.dart';

part 'app_routes.dart';

class AppPages {
  static final pages = [
    GetPage(
      name: Routes.homePage,
      page: () => const HomePage(),
    ),
    GetPage(
      name: Routes.settingsPage,
      page: () => SettingsPage(),
    ),
    GetPage(
      name: Routes.editPage,
      page: () => const EditPage(),
    ),
  ];
}
