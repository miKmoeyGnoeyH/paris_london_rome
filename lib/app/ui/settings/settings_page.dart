import 'package:flutter/material.dart';
import 'package:paris_london_rome/app/ui/widgets/custom_appbar.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    const String title = 'Settings';

    return const Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(50.0),
        child: CustomAppBar(
          title: title,
        ),
      ),
      body: Center(
        child: Text(title),
      ),
    );
  }
}
