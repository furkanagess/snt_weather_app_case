import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:snt_weather_app_case/feature/model/hourly_weather.dart';
import 'package:snt_weather_app_case/feature/model/weather.dart';
import 'package:http/http.dart' as http;
import 'package:snt_weather_app_case/product/constants/app_constants.dart';
import 'package:snt_weather_app_case/product/constants/app_strings.dart';

import 'temperature_unit_provider.dart';

class WeatherProvider with ChangeNotifier {
  String _selectedCity = AppStrings.initialCity;
  List<Weather> _weatherData = [];
  Weather? _currentWeather;
  String get selectedCity => _selectedCity;
  List<Weather> get weatherData => _weatherData;
  Weather? get currentWeather => _currentWeather;

  final TemperatureUnitProvider _temperatureUnitProvider =
      TemperatureUnitProvider();
  TemperatureUnitProvider get temperatureUnitProvider =>
      _temperatureUnitProvider;

  set selectedCity(String city) {
    _selectedCity = city;
    fetchWeatherData();
  }

  Future<void> fetchWeatherData() async {
    if (_selectedCity.isEmpty) {
      return;
    }
    final unit = temperatureUnitProvider.isCelsius
        ? AppConstants.metric
        : AppConstants.imperial;
    final apiUrl =
        '${AppConstants.baseUrl}$_selectedCity&units=$unit&appid=${AppConstants.apiKey}';

    final response = await http.get(Uri.parse(apiUrl));

    if (response.statusCode == 200) {
      final Map<String, dynamic> data = json.decode(response.body);

      _weatherData.clear();
      final List<dynamic> list = data['list'];
      final Map<String, List<dynamic>> groupedData = {};

      for (var item in list) {
        final DateTime dateTime = DateTime.parse(item['dt_txt']);
        final String dayName = DateFormat.EEEE().format(dateTime);

        if (!groupedData.containsKey(dayName)) {
          groupedData[dayName] = [];
        }
        groupedData[dayName]!.add(item);
      }

      _weatherData = groupedData.entries.map((entry) {
        final item = entry.value[0];
        final hourlyWeatherList = entry.value.map<HourlyWeather>((item) {
          final time = DateFormat.Hm().format(DateTime.parse(item['dt_txt']));
          return HourlyWeather(
            time: time,
            temperature: item['main']['temp'].toDouble(),
          );
        }).toList();

        return Weather(
          dayName: entry.key,
          temperature: item['main']['temp'].toDouble(),
          description: item['weather'][0]['description'],
          hourlyWeather: hourlyWeatherList,
        );
      }).toList();

      final currentWeatherItem = list[0];
      final currentHourlyWeatherList = list.map<HourlyWeather>((item) {
        final time = DateFormat.Hm().format(DateTime.parse(item['dt_txt']));
        return HourlyWeather(
          time: time,
          temperature: item['main']['temp'].toDouble(),
        );
      }).toList();

      _currentWeather = Weather(
        dayName: 'Current',
        temperature: currentWeatherItem['main']['temp'].toDouble(),
        description: currentWeatherItem['weather'][0]['description'],
        hourlyWeather: currentHourlyWeatherList,
      );

      notifyListeners();
    } else {
      throw Exception('Failed to load weather data');
    }
  }

  Future<void> fetchInitialData() async {
    await fetchWeatherData();
  }
}
