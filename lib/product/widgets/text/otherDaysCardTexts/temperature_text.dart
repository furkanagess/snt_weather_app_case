import 'package:flutter/material.dart';
import 'package:snt_weather_app_case/product/extensions/context_extension.dart';

@immutable
final class TemperatureText extends StatelessWidget {
  const TemperatureText({
    super.key,
    required this.temperature,
  });

  final String temperature;

  @override
  Widget build(BuildContext context) {
    return Text(
      temperature,
      style: context.textTheme.displaySmall!.copyWith(
        color: context.theme.colorScheme.onBackground,
      ),
    );
  }
}
