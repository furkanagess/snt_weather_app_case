import 'package:flutter/material.dart';

@immutable
final class AppStrings {
  const AppStrings._();
  static const String initialCity = 'Ankara';
  // Temperature Unit
  static const String celcius = '°C';
  static const String fahrenheit = '°F';

  // Bottom Navbar Label
  static const String weather = 'Weather';
  static const String settings = 'Settings';

  // Settings Page
  static const String settingsPage = 'Settings Page';
  static const String changeUnit = 'Change Temperature Unit';
  static const String changeTheme = 'Change Theme Mode';
  static const String currentLight = 'Current Theme: Light';
  static const String currentDark = 'Current Theme: Dark';
  static const String tempUnit = 'Temperature Unit: ';

  // Weather Page
  static const String searchLabel = 'Enter city name';
  static const String today = 'Today';
  static const String hourlyWeather = 'Hourly Weather';
  static const String dailyForecast = 'Daily Forecast';
  static const String currentForecast = 'Current Forecast';
}
