import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({
    super.key,
    required this.title,
    this.leading,
  });

  final String title;
  final Widget? leading;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: true,
      elevation: 1,
      surfaceTintColor: Colors.white,
      shape: Border(
          bottom: BorderSide(
        color: Colors.black.withAlpha(50),
        width: 0.5,
      )),
      title: Text(
        title,
        style: const TextStyle(fontSize: 20),
      ),
      leading: leading,
    );
  }
}
