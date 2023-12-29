import 'package:flutter/material.dart';

class SettingsCategoryTitleWidget extends StatelessWidget {
  const SettingsCategoryTitleWidget({
    super.key,
    required this.title,
  });

  final String title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10, right: 10, top: 20),
      child: Text(
        title,
        style: const TextStyle(fontSize: 20),
      ),
    );
  }
}

