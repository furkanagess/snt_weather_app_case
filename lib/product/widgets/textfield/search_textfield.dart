import 'package:flutter/material.dart';
import 'package:snt_weather_app_case/feature/viewModel/weather_provider.dart';
import 'package:snt_weather_app_case/product/constants/app_strings.dart';
import 'package:snt_weather_app_case/product/extensions/context_extension.dart';

@immutable
final class SearchTextfield extends StatelessWidget {
  const SearchTextfield({
    super.key,
    required TextEditingController cityController,
    required this.weatherProvider,
  }) : _cityController = cityController;

  final TextEditingController _cityController;
  final WeatherProvider weatherProvider;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: _cityController,
      decoration: InputDecoration(
        hintStyle: TextStyle(color: context.theme.colorScheme.primary),
        suffixIconColor: context.theme.colorScheme.onBackground,
        labelText: AppStrings.searchLabel,
        labelStyle: TextStyle(color: context.theme.colorScheme.onBackground),
        suffixIcon: IconButton(
          icon: const Icon(Icons.search),
          onPressed: () {
            weatherProvider.selectedCity = _cityController.text;
          },
        ),
      ),
    );
  }
}
