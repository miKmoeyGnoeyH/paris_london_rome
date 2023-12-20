import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:paris_london_rome/app/ui/settings/settings_page.dart';

import '../../routes/app_pages.dart';

class Settings extends StatelessWidget {
  const Settings({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
        onPressed: () => Get.toNamed(Routes.settingsPage),
        icon: const Icon(Icons.settings_outlined));
  }
}
