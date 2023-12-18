import 'package:flutter/material.dart';
import 'package:snt_weather_app_case/product/theme/theme.dart';

class AppThemeDark extends AppTheme {
  static AppThemeDark? _instance;
  static AppThemeDark get instance {
    _instance ??= AppThemeDark._init();
    return _instance!;
  }

  AppThemeDark._init();

  @override
  ThemeData get theme => ThemeData.light().copyWith(
        colorScheme: _buildColorScheme,
        appBarTheme: _appBarTheme,
        iconTheme: _iconTheme,
        bottomNavigationBarTheme: const BottomNavigationBarThemeData(
          selectedItemColor: Colors.purple,
          unselectedItemColor: Colors.white,
        ),
      );

  IconThemeData get _iconTheme => IconThemeData(
        color: _buildColorScheme.onSecondary,
        size: 30,
      );

  AppBarTheme get _appBarTheme => AppBarTheme(
        elevation: 0,
        backgroundColor: _buildColorScheme.background,
      );

  ColorScheme get _buildColorScheme => const ColorScheme(
        brightness: Brightness.dark,
        primary: Color.fromARGB(255, 108, 34, 121),
        onPrimary: Colors.blue,
        secondary: Colors.black,
        onSecondary: Colors.purple,
        error: Colors.red,
        onError: Colors.orange,
        background: Colors.black,
        onBackground: Colors.black, // used
        surface: Colors.yellow,
        onSurface: Colors.pink,
      );
}
