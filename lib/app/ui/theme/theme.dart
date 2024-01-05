import 'package:flutter/material.dart';

const List<String> fonts = [
  'Roboto',
  'DancingScript',
  'NanumMyeongjo',
];

const List<String> fontSizes = [
  'Small',
  'Default',
  'Large',
];

const ColorScheme darkColorScheme = ColorScheme(
  brightness: Brightness.dark,
  primary: Color(0xffcbfff5),
  onPrimary: Colors.black,
  secondary: Color(0xffffd9e7),
  onSecondary: Colors.black,
  tertiary: Color(0xfffff8c1),
  onTertiary: Colors.black,
  background: Colors.black,
  onBackground: Colors.white,
  surface: Colors.black,
  onSurface: Colors.white,
  error: Colors.red,
  onError: Colors.yellow,
);

const ColorScheme lightColorScheme = ColorScheme(
  brightness: Brightness.light,
  primary: Color(0xffcbfff5),
  onPrimary: Colors.black,
  secondary: Color(0xffffd9e7),
  onSecondary: Colors.black,
  tertiary: Color(0xfffff8c1),
  onTertiary: Colors.black,
  background: Colors.white,
  onBackground: Colors.black,
  surface: Colors.white,
  onSurface: Colors.black,
  error: Colors.red,
  onError: Colors.yellow,
);

const TextTheme smallTextTheme = TextTheme(
  displayLarge: TextStyle(
    fontSize: 35,
    fontWeight: FontWeight.bold,
  ),
  titleLarge: TextStyle(
    fontSize: 14,
  ),
  titleMedium: TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.normal,
  ),
  bodyLarge: TextStyle(
    fontSize: 12,
  ),
  bodyMedium: TextStyle(
    fontSize: 10,
  ),
);

const TextTheme defaultTextTheme = TextTheme(
  displayLarge: TextStyle(
    fontSize: 35,
    fontWeight: FontWeight.bold,
  ),
  titleLarge: TextStyle(
    fontSize: 20,
  ),
  titleMedium: TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.normal,
  ),
  bodyLarge: TextStyle(
    fontSize: 14,
  ),
  bodyMedium: TextStyle(
    fontSize: 12,
  ),
);

const TextTheme largeTextTheme = TextTheme(
  displayLarge: TextStyle(
    fontSize: 35,
    fontWeight: FontWeight.bold,
  ),
  titleLarge: TextStyle(
    fontSize: 24,
  ),
  titleMedium: TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.normal,
  ),
  bodyLarge: TextStyle(
    fontSize: 20,
  ),
  bodyMedium: TextStyle(
    fontSize: 14,
  ),
);

TextTheme defineTextTheme(String fontSize) {
  switch (fontSize) {
    case 'Small':
      return smallTextTheme;
    case 'Default':
      return defaultTextTheme;
    case 'Large':
      return largeTextTheme;
    default:
      return defaultTextTheme;
  }
}
