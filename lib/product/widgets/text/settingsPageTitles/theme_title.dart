import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:snt_weather_app_case/feature/view/weather_view.dart';
import 'package:snt_weather_app_case/feature/viewModel/theme_provider.dart';
import 'package:snt_weather_app_case/product/constants/app_strings.dart';
import 'package:snt_weather_app_case/product/constants/enums.dart';

class ThemeTitle extends StatelessWidget {
  const ThemeTitle({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return WeatherPageTitle(
      title: context.watch<ThemeProvider>().currenThemeEnum == AppThemes.light
          ? AppStrings.currentLight
          : AppStrings.currentDark,
    );
  }
}
