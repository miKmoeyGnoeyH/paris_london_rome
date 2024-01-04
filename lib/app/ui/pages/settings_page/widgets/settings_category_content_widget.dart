import 'package:flutter/material.dart';

class SettingsCategoryContentWidget extends StatelessWidget {
  const SettingsCategoryContentWidget({
    super.key,
    required this.name,
    this.child,
  });

  final String name;
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(color: Theme.of(context).colorScheme.onBackground.withAlpha(127)),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              name,
              style: Theme.of(context).textTheme.titleMedium,
            ),
            child ?? const SizedBox(),
          ],
        ),
      ),
    );
  }
}
