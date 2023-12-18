import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:snt_weather_app_case/feature/viewModel/temperature_unit_provider.dart';
import 'package:snt_weather_app_case/product/constants/app_strings.dart';
import 'package:snt_weather_app_case/product/widgets/button/elevated_icon_button.dart';

class ChangeUnitButton extends StatelessWidget {
  const ChangeUnitButton({
    super.key,
    this.unitProvider,
  });

  final TemperatureUnitProvider? unitProvider;

  @override
  Widget build(BuildContext context) {
    return ElevatedIconButton(
      onPressed: () {
        context.read<TemperatureUnitProvider>().toggleTemperatureUnit();
      },
      label: AppStrings.changeUnit,
      icon: const Icon(
        Icons.thermostat,
        color: Colors.black,
      ),
    );
  }
}
