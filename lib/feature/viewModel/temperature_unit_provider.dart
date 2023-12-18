import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:snt_weather_app_case/product/constants/app_constants.dart';
import 'package:snt_weather_app_case/product/constants/app_strings.dart';

class TemperatureUnitProvider with ChangeNotifier {
  bool _isCelsius = true;

  TemperatureUnitProvider() {
    _loadTemperatureUnit();
  }

  bool get isCelsius => _isCelsius;

  void toggleTemperatureUnit() {
    _isCelsius = !_isCelsius;
    notifyListeners();
    _saveTemperatureUnit();
  }

  double convertTemperature(double temperature) {
    double value = _isCelsius ? temperature : (temperature * 9 / 5) + 32;
    return double.parse(value.toStringAsFixed(1));
  }

  String getTemperatureUnit() {
    return _isCelsius ? AppStrings.celcius : AppStrings.fahrenheit;
  }

  Future<void> _loadTemperatureUnit() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool? isCelsius = prefs.getBool(AppConstants.prefKey);
    if (isCelsius != null) {
      _isCelsius = isCelsius;
      notifyListeners();
    }
  }

  Future<void> _saveTemperatureUnit() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool(AppConstants.prefKey, _isCelsius);
  }
}
