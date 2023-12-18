import 'package:flutter/material.dart';

@immutable
final class AppConstants {
  const AppConstants._();
  static const String apiKey = '662df178454b6a5defe956158eb295c0';
  static const String baseUrl =
      'https://api.openweathermap.org/data/2.5/forecast?q=';
  static const String metric = 'metric';
  static const String imperial = 'imperial';
  static const String prefKey = 'temperature_unit';
}
