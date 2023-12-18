import 'package:flutter/material.dart';

import 'package:snt_weather_app_case/product/constants/enums.dart';
import 'package:snt_weather_app_case/product/theme/light_theme.dart';

class ThemeProvider extends ChangeNotifier {
  ThemeData _currentTheme = AppThemeLight.instance.theme;
  ThemeData get currentTheme => _currentTheme;

  AppThemes _currenThemeEnum = AppThemes.light;
  AppThemes get currenThemeEnum => _currenThemeEnum;

  void changeValue(AppThemes theme) {
    if (theme == AppThemes.light) {
      _currentTheme = ThemeData.light();
    } else {
      _currentTheme = ThemeData.dark();
    }
    notifyListeners();
  }

  void changeTheme() {
    if (_currenThemeEnum == AppThemes.light) {
      _currentTheme = ThemeData.dark();
      _currenThemeEnum = AppThemes.dark;
    } else {
      _currentTheme = AppThemeLight.instance.theme;
      _currenThemeEnum = AppThemes.light;
    }
    notifyListeners();
  }
}
