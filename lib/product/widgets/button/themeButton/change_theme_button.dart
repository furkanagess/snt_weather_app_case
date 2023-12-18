import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:snt_weather_app_case/feature/viewModel/theme_provider.dart';
import 'package:snt_weather_app_case/product/constants/app_strings.dart';
import 'package:snt_weather_app_case/product/constants/enums.dart';
import 'package:snt_weather_app_case/product/widgets/button/elevated_icon_button.dart';

class ChangeThemeButton extends StatelessWidget {
  const ChangeThemeButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedIconButton(
      onPressed: () {
        context.read<ThemeProvider>().changeTheme();
      },
      label: AppStrings.changeTheme,
      icon: context.watch<ThemeProvider>().currenThemeEnum == AppThemes.light
          ? const Icon(
              Icons.sunny,
              color: Colors.black,
            )
          : const Icon(
              Icons.dark_mode,
              color: Colors.black,
            ),
    );
  }
}
