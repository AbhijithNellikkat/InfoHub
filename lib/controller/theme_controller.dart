import 'package:flutter/material.dart';

class ThemeProvider extends ChangeNotifier {
  ThemeData _themeData = _lightTheme;
  ThemeMode _currentTheme = ThemeMode.light;

  static final ThemeData _lightTheme = ThemeData(
    useMaterial3: true,
    // Light theme configuration
    brightness: Brightness.light,
    primaryColor: Colors.blue, // Change to your desired color
    hintColor: Colors.blueAccent, // Change to your desired color
    // Add other light theme configurations here
  );

  static final ThemeData _darkTheme = ThemeData(
    useMaterial3: true,
    // Dark theme configuration
    brightness: Brightness.dark,
    primaryColor: Colors.orange, // Change to your desired color
    hintColor: Colors.orangeAccent, // Change to your desired color
    // Add other dark theme configurations here
  );

  ThemeData get themeData => _themeData;

  ThemeMode get currentTheme => _currentTheme;

  void toggleTheme() {
    _currentTheme =
        (_currentTheme == ThemeMode.light) ? ThemeMode.dark : ThemeMode.light;
    _themeData = (_currentTheme == ThemeMode.light) ? _lightTheme : _darkTheme;
    notifyListeners();
  }
}
