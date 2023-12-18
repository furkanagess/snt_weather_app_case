import 'package:flutter/material.dart';
import 'package:snt_weather_app_case/product/extensions/context_extension.dart';
import 'package:snt_weather_app_case/product/widgets/text/otherDaysCardTexts/day_text.dart';
import 'package:snt_weather_app_case/product/widgets/text/otherDaysCardTexts/description_text.dart';
import 'package:snt_weather_app_case/product/widgets/text/otherDaysCardTexts/temperature_text.dart';

@immutable
final class OtherDaysWeathersCard extends StatelessWidget {
  const OtherDaysWeathersCard({
    super.key,
    required this.dayName,
    required this.temperature,
    required this.description,
  });
  final String dayName;
  final String temperature;
  final String description;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: context.theme.colorScheme.onPrimary,
      elevation: 5,
      child: Padding(
        padding: context.paddingNormal,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            DayText(dayName: dayName),
            Padding(
              padding: context.paddingLowVertical,
              child: TemperatureText(temperature: temperature),
            ),
            const Spacer(),
            DescriptionText(description: description),
          ],
        ),
      ),
    );
  }
}
