import 'package:flutter/material.dart';
import 'package:snt_weather_app_case/product/extensions/context_extension.dart';

@immutable
final class DescriptionText extends StatelessWidget {
  const DescriptionText({
    super.key,
    required this.description,
  });

  final String description;

  @override
  Widget build(BuildContext context) {
    return Text(
      description,
      style: context.textTheme.titleSmall!.copyWith(
        color: context.theme.colorScheme.onBackground,
      ),
    );
  }
}
