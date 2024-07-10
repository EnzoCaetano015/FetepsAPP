import 'dart:ffi';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeProvider with ChangeNotifier {
  ThemeMode _themeMode = ThemeMode.light;

  ThemeProvider() {
    _loadTheme();
  }

  ThemeMode get themeMode => _themeMode;

  void toggleTheme() async {
    _themeMode =
        _themeMode == ThemeMode.light ? ThemeMode.dark : ThemeMode.light;
    notifyListeners();
    _saveTheme();
  }

  void _loadTheme() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? theme = prefs.getString('theme');
    if (theme != null) {
      _themeMode = theme == 'light' ? ThemeMode.light : ThemeMode.dark;
      notifyListeners();
    }
  }

  void _saveTheme() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('theme', _themeMode == ThemeMode.light ? 'light' : 'dark');
  }

  String getLogoAsset() {
    return _themeMode == ThemeMode.light
        ? 'lib/assets/logo.png'
        : 'lib/assets/logo2.png';
  }

  Color getBorderColor() {
    return _themeMode == ThemeMode.light ? Colors.black : Colors.white;
  }

  Color getSpecialColor() {
    return _themeMode == ThemeMode.light
        ? const Color(0xFF0E414F)
        : const Color(0xFFFFD35F);
  }

  Color getSpecialColor2() {
    return _themeMode == ThemeMode.light
        ? const Color(0xFF0E414F)
        : Colors.white;
  }
}

final ThemeData lightTheme = ThemeData(
  primaryColor: Colors.white,
  scaffoldBackgroundColor: Colors.white,
  appBarTheme: AppBarTheme(
    backgroundColor: Colors.white,
    foregroundColor: Colors.black,
  ),
  textTheme: TextTheme(
    bodyLarge: TextStyle(color: Colors.black),
    bodyMedium: TextStyle(color: Colors.black),
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      foregroundColor: Colors.black,
      backgroundColor: Colors.white,
    ),
  ),
);

final ThemeData darkTheme = ThemeData(
  primaryColor: Colors.black,
  scaffoldBackgroundColor: Colors.black,
  appBarTheme: AppBarTheme(
    backgroundColor: Colors.black,
    foregroundColor: Colors.white,
  ),
  textTheme: TextTheme(
    bodyLarge: TextStyle(color: Colors.white),
    bodyMedium: TextStyle(color: Colors.black),
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      foregroundColor: Colors.white,
      backgroundColor: Colors.black,
    ),
  ),
);
