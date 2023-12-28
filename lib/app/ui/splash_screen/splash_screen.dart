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
        MaterialPageRoute(builder: (context) => const HomePage()),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white,
        child: const Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('PARIS', style: TextStyle(color: Colors.black, fontSize: 35, fontWeight: FontWeight.bold),),
              Text('LONDON', style: TextStyle(color: Colors.black, fontSize: 35, fontWeight: FontWeight.bold),),
              Text('ROME', style: TextStyle(color: Colors.black, fontSize: 35, fontWeight: FontWeight.bold),),
            ],
          ),
        ),
      ),
    );
  }
}
