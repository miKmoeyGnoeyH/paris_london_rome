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
      padding: const EdgeInsets.only(left: 10, right: 10, top: 20, bottom: 5),
      child: Text(
        title,
        style: Theme.of(context).textTheme.titleLarge,
      ),
    );
  }
}

