import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:snt_weather_app_case/feature/viewModel/temperature_unit_provider.dart';
import 'package:snt_weather_app_case/feature/viewModel/weather_provider.dart';
import 'package:snt_weather_app_case/product/constants/app_strings.dart';
import 'package:snt_weather_app_case/product/extensions/context_extension.dart';
import 'package:snt_weather_app_case/product/widgets/card/hourly_current_card.dart';
import 'package:snt_weather_app_case/product/widgets/card/other_day_weather_card.dart';
import 'package:snt_weather_app_case/product/widgets/sizedBox/vertical_divider.dart';
import 'package:snt_weather_app_case/product/widgets/text/page_subtitle.dart';
import 'package:snt_weather_app_case/product/widgets/textfield/search_textfield.dart';

class WeatherPage extends StatelessWidget {
  final TextEditingController _cityController = TextEditingController();

  WeatherPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Padding(
          padding: context.paddingLow,
          child: SearchTextfield(
              cityController: _cityController,
              weatherProvider: context.read<WeatherProvider>()),
        ),
      ),
      body: context.read<WeatherProvider>().currentWeather != null
          ? Padding(
              padding: context.paddingLowHorizontal,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const VerticalSpacer(dynamicHeight: 0.02),
                  const WeatherPageTitle(
                    title: AppStrings.currentForecast,
                  ),
                  Expanded(
                    flex: 6,
                    child: CurrentWeatherCard(
                        unitProvider: context.read<TemperatureUnitProvider>(),
                        weatherProvider: context.read<WeatherProvider>()),
                  ),
                  const VerticalSpacer(dynamicHeight: 0.05),
                  const WeatherPageTitle(
                    title: AppStrings.dailyForecast,
                  ),
                  Expanded(
                    flex: 3,
                    child: OtherDaysList(
                        weatherProvider: context.read<WeatherProvider>(),
                        unitProvider: context.read<TemperatureUnitProvider>()),
                  ),
                  const VerticalSpacer(dynamicHeight: 0.05),
                ],
              ),
            )
          : const SizedBox(),
    );
  }
}

class WeatherPageTitle extends StatelessWidget {
  const WeatherPageTitle({
    super.key,
    required this.title,
  });
  final String title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: context.paddingNormalHorizontal,
      child: PageSubtitle(
        title: title,
      ),
    );
  }
}

class OtherDaysList extends StatelessWidget {
  const OtherDaysList({
    super.key,
    required this.weatherProvider,
    required this.unitProvider,
  });

  final WeatherProvider weatherProvider;
  final TemperatureUnitProvider unitProvider;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: weatherProvider.weatherData.length,
      itemBuilder: (context, index) {
        final weatherData = weatherProvider.weatherData[index];
        return Padding(
          padding: context.paddingLow,
          child: OtherDaysWeathersCard(
            dayName: weatherData.dayName,
            temperature:
                '${unitProvider.convertTemperature(weatherData.temperature)} ${unitProvider.getTemperatureUnit()}',
            description: weatherData.description.toUpperCase(),
          ),
        );
      },
    );
  }
}

class CurrentWeatherCard extends StatelessWidget {
  const CurrentWeatherCard({
    super.key,
    required this.unitProvider,
    required this.weatherProvider,
  });

  final TemperatureUnitProvider unitProvider;
  final WeatherProvider weatherProvider;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        color: context.theme.colorScheme.onPrimary,
        elevation: 5,
        child: Padding(
          padding: context.paddingNormal,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                flex: 4,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CurrentWeatherDescriptions(
                      unitProvider: unitProvider,
                      weatherProvider: weatherProvider,
                    ),
                    CityName(weatherProvider: weatherProvider),
                  ],
                ),
              ),
              Expanded(
                flex: 3,
                child: HourlyCurrentList(
                    weatherProvider: weatherProvider,
                    unitProvider: unitProvider),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CurrentWeatherDescriptions extends StatelessWidget {
  const CurrentWeatherDescriptions({
    super.key,
    required this.unitProvider,
    required this.weatherProvider,
  });

  final TemperatureUnitProvider unitProvider;
  final WeatherProvider weatherProvider;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          AppStrings.today,
          style: context.textTheme.headlineSmall!.copyWith(
            color: context.theme.colorScheme.onBackground,
          ),
        ),
        Padding(
          padding: context.paddingLowVertical,
          child: Text(
            '${unitProvider.convertTemperature(weatherProvider.currentWeather!.temperature)} ${unitProvider.getTemperatureUnit()}',
            style: context.textTheme.displaySmall!.copyWith(
              color: context.theme.colorScheme.onBackground,
            ),
          ),
        ),
        Text(
          weatherProvider.currentWeather!.description.toUpperCase(),
          style: context.textTheme.titleMedium!.copyWith(
            color: context.theme.colorScheme.onBackground,
          ),
        ),
      ],
    );
  }
}

class HourlyCurrentList extends StatelessWidget {
  const HourlyCurrentList({
    super.key,
    required this.weatherProvider,
    required this.unitProvider,
  });

  final WeatherProvider weatherProvider;
  final TemperatureUnitProvider unitProvider;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: weatherProvider.currentWeather!.hourlyWeather.length,
      itemBuilder: (context, index) {
        final hourlyWeather =
            weatherProvider.currentWeather!.hourlyWeather[index];
        return HourlyCurrentCard(
          time: hourlyWeather.time,
          temperature:
              '${unitProvider.convertTemperature(hourlyWeather.temperature)} ${unitProvider.getTemperatureUnit()}',
        );
      },
    );
  }
}

class CityName extends StatelessWidget {
  const CityName({
    super.key,
    required this.weatherProvider,
  });

  final WeatherProvider weatherProvider;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          weatherProvider.selectedCity.toUpperCase(),
          style: context.textTheme.headlineLarge!.copyWith(
            color: context.theme.colorScheme.onBackground,
          ),
        ),
      ],
    );
  }
}
