import 'package:flutter/material.dart';
import 'package:snt_weather_app_case/feature/model/hourly_weather.dart';

@immutable
final class Weather {
  final String dayName;
  final double temperature;
  final String description;
  final List<HourlyWeather> hourlyWeather;

  const Weather({
    required this.dayName,
    required this.temperature,
    required this.description,
    required this.hourlyWeather,
  });
}
