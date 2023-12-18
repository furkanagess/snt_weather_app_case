import 'package:flutter/material.dart';
import 'package:snt_weather_app_case/product/extensions/context_extension.dart';
import 'package:snt_weather_app_case/product/widgets/sizedBox/vertical_divider.dart';

@immutable
final class HourlyCurrentCard extends StatelessWidget {
  const HourlyCurrentCard({
    super.key,
    required this.time,
    required this.temperature,
  });
  final String time;
  final String temperature;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: context.theme.colorScheme.onSecondary,
      child: Padding(
        padding: context.paddingLow,
        child: Column(
          children: [
            Text(
              time,
              style: context.textTheme.bodyMedium!.copyWith(
                color: context.theme.colorScheme.onBackground,
              ),
            ),
            const VerticalSpacer(dynamicHeight: 0.03),
            Text(
              temperature,
              style: context.textTheme.titleMedium!.copyWith(
                color: context.theme.colorScheme.onBackground,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
