import 'package:flutter/material.dart';
import 'package:snt_weather_app_case/product/extensions/context_extension.dart';

@immutable
final class VerticalSpacer extends StatelessWidget {
  const VerticalSpacer({
    super.key,
    required this.dynamicHeight,
  });
  final double dynamicHeight;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: context.dynamicHeight(dynamicHeight),
    );
  }
}
