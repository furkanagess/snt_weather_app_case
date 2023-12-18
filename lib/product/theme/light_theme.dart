import 'package:flutter/material.dart';
import 'package:snt_weather_app_case/product/theme/theme.dart';

class AppThemeLight extends AppTheme {
  static final AppThemeLight instance = AppThemeLight._();

  AppThemeLight._();

  @override
  ThemeData get theme => ThemeData.light().copyWith(
        colorScheme: _buildColorScheme,
        appBarTheme: _appBarTheme,
        iconTheme: _iconTheme,
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
          selectedItemColor: _buildColorScheme.onSecondary,
          unselectedItemColor: _buildColorScheme.onBackground,
        ),
      );

  IconThemeData get _iconTheme => IconThemeData(
        color: _buildColorScheme.secondary,
        size: 30,
      );

  AppBarTheme get _appBarTheme => AppBarTheme(
        elevation: 0,
        backgroundColor: _buildColorScheme.background,
        titleTextStyle: TextStyle(color: _buildColorScheme.onBackground),
        iconTheme: IconThemeData(color: _buildColorScheme.onBackground),
      );

  ColorScheme get _buildColorScheme => const ColorScheme(
        brightness: Brightness.light,
        primary: Color(0xffCAEDFF), // used
        onPrimary: Color(0xff9ED2BE), // used
        secondary: Color(0xFF6c63ff), // used
        onSecondary: Color.fromARGB(255, 96, 141, 123),
        error: Colors.red,
        onError: Colors.orange,
        background: Colors.white, // used
        onBackground: Colors.black, // used
        surface: Colors.purple,
        onSurface: Colors.transparent,
      );
}
