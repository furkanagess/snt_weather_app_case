import 'package:flutter/material.dart';
import 'package:snt_weather_app_case/product/extensions/context_extension.dart';

@immutable
final class DayText extends StatelessWidget {
  const DayText({
    super.key,
    required this.dayName,
  });

  final String dayName;

  @override
  Widget build(BuildContext context) {
    return Text(
      dayName,
      style: context.textTheme.titleLarge!.copyWith(
        color: context.theme.colorScheme.onBackground,
      ),
    );
  }
}
