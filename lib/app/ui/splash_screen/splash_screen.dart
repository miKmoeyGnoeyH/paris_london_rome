import 'dart:async';

import 'package:flutter/material.dart';

import 'package:paris_london_rome/app/ui/home/home_page.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(
      const Duration(seconds: 1),
      () => Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => HomePage()),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Center(
      child: SizedBox(
        width: width * 0.7,
        height: height * 0.7,
        child: const Column(
          children: [
            Text(
              'PARIS',
            ),
            Text('LONDON'),
            Text('ROME'),
          ],
        ),
      ),
    );
  }
}
