import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:snt_weather_app_case/feature/view/weather_view.dart';
import 'package:snt_weather_app_case/feature/viewModel/temperature_unit_provider.dart';
import 'package:snt_weather_app_case/product/constants/app_strings.dart';
import 'package:snt_weather_app_case/product/extensions/context_extension.dart';
import 'package:snt_weather_app_case/product/widgets/button/themeButton/change_theme_button.dart';
import 'package:snt_weather_app_case/product/widgets/button/themeButton/change_unite_button.dart';
import 'package:snt_weather_app_case/product/widgets/sizedBox/vertical_divider.dart';
import 'package:snt_weather_app_case/product/widgets/text/settingsPageTitles/theme_title.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          AppStrings.settingsPage,
          style: context.textTheme.titleLarge,
        ),
      ),
      body: Scaffold(
        body: Padding(
          padding: context.paddingLowHorizontal,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Spacer(),
                Expanded(
                  child: Column(
                    children: [
                      WeatherPageTitle(
                        title: AppStrings.tempUnit +
                            context
                                .watch<TemperatureUnitProvider>()
                                .getTemperatureUnit(),
                      ),
                      const VerticalSpacer(dynamicHeight: 0.02),
                      const ChangeUnitButton()
                    ],
                  ),
                ),
                const Expanded(
                  child: Column(
                    children: [
                      ThemeTitle(),
                      VerticalSpacer(dynamicHeight: 0.02),
                      ChangeThemeButton()
                    ],
                  ),
                ),
                const Spacer(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
