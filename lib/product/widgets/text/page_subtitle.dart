import 'package:flutter/material.dart';
import 'package:snt_weather_app_case/product/extensions/context_extension.dart';

@immutable
final class PageSubtitle extends StatelessWidget {
  const PageSubtitle({
    super.key,
    required this.title,
  });
  final String title;
  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: context.textTheme.titleLarge!
          .copyWith(color: context.theme.colorScheme.onBackground),
    );
  }
}
